// Define route names as constants for better manageability
import 'package:flutter/material.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/features/auth/presentation/lognin/presentation/login_screen.dart';
import 'package:resume_app/features/auth/presentation/signup/presentation/singup_presentation.dart';

class Routes {
  static const String login = '/login';
  static const String signUP = '/signUP';
  static const String profile = '/profile';
}

// Route manager to handle navigation
class RouteManager {
  static Route<String> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUP:
        return MaterialPageRoute(builder: (_) => const SignUpPresentation());
      case Routes.login:
        initLoginModule();
        return MaterialPageRoute(
            builder: (_) => const LoginScreenPresentation());
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
