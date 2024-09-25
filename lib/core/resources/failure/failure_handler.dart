import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/resources/failure/failure_registry.dart';

abstract class FailureHandle {
  FailureHandle() {
    FailureRegistry.registerHandler(this);
  }

  void initialize(FailureHandler handler);
}

class BaseFailureHandle extends FailureHandle {
  final String code;
  final Failure failure;

  BaseFailureHandle({
    required this.code,
    required this.failure,
  });

  @override
  void initialize(FailureHandler handler) {
    handler.addFailureHandle(this);
  }

  Failure? mapFailure(String code) {
    if (this.code == code) {
      return failure;
    }
    return null;
  }
}

class FailureHandler {
  final List<BaseFailureHandle> _failureHandles = [];

  void addFailureHandle(BaseFailureHandle handle) {
    _failureHandles.add(handle);
  }

  Failure handleFailure(String code) {
    for (var handle in _failureHandles) {
      final failure = handle.mapFailure(code);
      if (failure != null) {
        return failure;
      }
    }

    return Failure(
        id: -1, message: "UnKnown Error: $code"); // Or return a default failure
  }
}
