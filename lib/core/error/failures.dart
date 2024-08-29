import 'package:dio/dio.dart';

abstract interface class BaseFailure implements Exception {
  final Exception? exception;
  final String? failureMessage;
  BaseFailure({this.exception, this.failureMessage});
}

class ApiFailure extends BaseFailure {
  DioException? error;
  ApiFailure({
    this.error,
    required super.failureMessage,
  }) : super(exception: error);
}

class NetworkConnectionFailure extends BaseFailure {
  NetworkConnectionFailure({required String networkFailureMessage}) : super(failureMessage: networkFailureMessage);
}

class GeneralExceptionFailure extends BaseFailure {
  GeneralExceptionFailure({
    required dynamic error,
    String? failureMessage,
  });
}

class UnKnownFailure extends BaseFailure {
  UnKnownFailure({
    required super.failureMessage,
  });
}
