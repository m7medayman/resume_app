// Define route names as constants for better manageability
import 'package:flutter/material.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/Di/home_moule.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/features/auth/presentation/lognin/presentation/login_screen.dart';
import 'package:resume_app/features/auth/presentation/signup/presentation/singup_presentation.dart';
import 'package:resume_app/features/home/presentation/home_page_view.dart';
import 'package:resume_app/features/pdf_creator/presentation/view/pdf_view.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_application_view_screen/job_application_view_screen.dart';

class Routes {
  static const String login = '/';
  static const String home = "/home";
  static const String signUP = '/signUP';
  static const String profile = '/profile';
  static const String pdfView = '/pdfView';
  static const String resumeApplication = "/resume_apply";
}

// Route manager to handle navigation
class RouteManager {
  static Route<String> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.resumeApplication:
        initResumeDialogModel();
        return MaterialPageRoute(
            builder: (_) => const JobApplicationViewScreen());
      case Routes.pdfView:
        initPdfViewerModule(settings.arguments as PdfData);
        return MaterialPageRoute(builder: (_) => PdfView());
      case Routes.home:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomePageView());
      case Routes.signUP:
        initSignupModule();
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
