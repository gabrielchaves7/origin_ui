import 'package:domain/src/injection.dart';

class OriginUiDomain {
  factory OriginUiDomain() {
    return _instance;
  }

  OriginUiDomain._() {
    configureDependencies();
  }

  static bool _initialized = false;
  static late OriginUiDomain _instance;
  static void init() {
    if (!_initialized) {
      _instance = OriginUiDomain._();
      _initialized = true;
    }
  }
}
