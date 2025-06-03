import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_failure.dart';

part 'failure_result.freezed.dart';

@freezed
class FailureResult with _$FailureResult {
  const factory FailureResult({
    required FailureReasons reason,
    required String debugMessage,
    ApiResponseFailureModel? model,
  }) = _FailureResult;
}

enum FailureReasons {
  noInternetConnection,
  timeout,
  tokenExpired,
  unknown,
  storage,
  unauthorized,
  forbidden,
  badRequest,
}
