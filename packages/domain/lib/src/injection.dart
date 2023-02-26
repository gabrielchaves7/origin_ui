import 'package:domain/origin_ui_usecases.dart';
import 'package:domain/src/data/datasource/score/score_datasource_impl.dart';
import 'package:domain/src/data/repositories/score/score_repository_impl.dart';
import 'package:domain/src/domain/repositories/score/score_repository.dart';
import 'package:domain/src/http/http_provider.dart';
import 'package:domain/src/http/http_provider_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  //Http
  if (!getIt.isRegistered<IHttpProvider>()) {
    getIt.registerLazySingleton<IHttpProvider>(
      HttpProvider.new,
    );
  }

  //repositories
  if (!getIt.isRegistered<ScoreRepository>()) {
    getIt.registerLazySingleton<ScoreRepository>(
      () => ScoreRepositoryImpl(scoreDataSource: getIt()),
    );
  }

  //datasources
  if (!getIt.isRegistered<ScoreDataSource>()) {
    getIt.registerLazySingleton<ScoreDataSource>(
      () => ScoreDataSourceImpl(http: getIt()),
    );
  }

  //usecases
  if (!getIt.isRegistered<GetScoreUseCase>()) {
    getIt.registerLazySingleton<GetScoreUseCase>(
      () => GetScoreUseCase(scoreRepository: getIt()),
    );
  }
}
