// Define route names as constants for better manageability
import 'package:flutter/material.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/features/auth/presentation/lognin/presentation/login_screen.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/signUP';
  static const String profile = '/profile';
}

// Route manager to handle navigation
class RouteManager {
  static Route<String> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginScreenPresentation());
      // case Routes.profile:
      //   return MaterialPageRoute(builder: (_) => signUpPresentation());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
