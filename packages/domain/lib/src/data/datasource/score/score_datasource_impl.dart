import 'dart:convert';

import 'package:domain/src/constants.dart';
import 'package:domain/src/data/models/score/score_model.dart';
import 'package:http/http.dart' as http;

// ignore: one_member_abstracts
abstract class ScoreDataSource {
  Future<ScoreModel> get({
    required String annualIncome,
    required String monthlyCosts,
  });
}

class ScoreDataSourceImpl implements ScoreDataSource {
  ScoreDataSourceImpl();

  @override
  Future<ScoreModel> get({
    required String annualIncome,
    required String monthlyCosts,
  }) async {
    final queryParameters = {
      'annualIncome': annualIncome,
      'monthlyCosts': monthlyCosts,
    };
    final uri = Uri.http(Constants.apiBaseUrl, '/api/score', queryParameters);
    final response = await http.get(uri);
    return ScoreModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
