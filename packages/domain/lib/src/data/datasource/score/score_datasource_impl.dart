import 'package:domain/src/data/models/score/score_model.dart';
import 'package:domain/src/enum/score_status_enum.dart';
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
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    return ScoreModel(
      annualIncome: 1000,
      monthlyCosts: 10,
      status: ScoreStatusEnum.healthy,
    );
  }
}
