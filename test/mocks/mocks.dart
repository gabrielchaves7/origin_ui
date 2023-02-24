import 'package:bloc_test/bloc_test.dart';
import 'package:domain/origin_ui_usecases.dart';
import 'package:mocktail/mocktail.dart';
import 'package:origin_ui/home/cubit/home_cubit.dart';

class MockGetScoreUseCase extends Mock implements GetScoreUseCase {}

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}
