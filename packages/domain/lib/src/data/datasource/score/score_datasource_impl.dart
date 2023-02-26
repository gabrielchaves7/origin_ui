import 'dart:convert';
import 'package:domain/src/data/models/score/score_model.dart';
import 'package:domain/src/http/http_provider.dart';

// ignore: one_member_abstracts
abstract class ScoreDataSource {
  Future<ScoreModel> post({
    required String annualIncome,
    required String monthlyCosts,
  });
}

class ScoreDataSourceImpl implements ScoreDataSource {
  ScoreDataSourceImpl({required this.http});
  final IHttpProvider http;

  @override
  Future<ScoreModel> post({
    required String annualIncome,
    required String monthlyCosts,
  }) async {
    final response = await http.post(
      '/api/score',
      body: {
        'annualIncome': int.parse(annualIncome),
        'monthlyCosts': int.parse(monthlyCosts),
      },
    );
    return ScoreModel.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
