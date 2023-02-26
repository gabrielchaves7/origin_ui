abstract class Failure {
  Failure();
}

class UnexpectedFailure extends Failure implements Exception {
  UnexpectedFailure();
}

class UnexpectedValue extends Failure implements Exception {
  UnexpectedValue();
}

class HttpResponseError extends Failure implements Exception {
  HttpResponseError();
}
