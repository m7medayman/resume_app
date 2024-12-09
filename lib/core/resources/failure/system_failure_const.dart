import 'package:resume_app/core/resources/failure/failure_model.dart';

class SystemFailureConstants {
  static Failure systemPermissionDenied =
      Failure(id: 30001, message: "System Permission Denied");
  static Failure noInternetConnection =
      Failure(id: 2000, message: "No internet connection");
  static Failure serverIsBusy = Failure(
      id: 4444, message: "Server is busy now , try again after 30 seconds");
}
