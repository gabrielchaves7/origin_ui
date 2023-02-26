// ignore_for_file: strict_raw_type, one_member_abstracts

import 'package:http/http.dart';

abstract class IHttpProvider {
  Future<Response> post(
    String path, {
    dynamic body,
  });
}
