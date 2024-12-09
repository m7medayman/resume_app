import 'package:resume_app/core/resources/failure/failure_handler.dart';

class FailureRegistry {
  static final List<FailureHandle> registeredHandlers = [];

  static void registerHandler(FailureHandle handler) {
    registeredHandlers.add(handler);

  }

  static void initializeAll(FailureHandler handler) {
    for (var failureHandle in registeredHandlers) {
      failureHandle.initialize(handler);
    }
  }
}
