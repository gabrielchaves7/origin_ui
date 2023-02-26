// ignore_for_file: strict_raw_type

import 'dart:convert';
import 'dart:io';

import 'package:domain/src/constants.dart';
import 'package:domain/src/domain/errors/failure.dart';
import 'package:domain/src/http/http_extensions.dart';

import 'package:domain/src/http/http_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpProvider implements IHttpProvider {
  HttpProvider();

  Map<String, dynamic> _parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  Uri _getUri(String path) {
    return Uri.http(Constants.apiBaseUrl, path);
  }

  void _validateResponse(Response response) {
    if (!response.ok) {
      throw HttpResponseError();
    }
  }

  final _headers = {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Future<Response> post(
    String path, {
    dynamic body,
  }) async {
    final response = await http.post(
      _getUri(path),
      body: jsonEncode(body),
      headers: _headers,
    );
    _validateResponse(response);

    return response;
  }
}
