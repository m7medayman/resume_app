import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/core/screen_manager/screen_service_manager.dart';
import 'package:resume_app/core/theme_manager/theme_manager.dart';
import 'package:resume_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(    options: DefaultFirebaseOptions.currentPlatform
);
  initModule();

  // configureDependencies(Env.dev);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    initThemeModule(screenWidth);
    MyTheme myThemeManager = getIt<MyTheme>();
    ScreenSizeService screenSizeService = getIt<ScreenSizeService>();
    screenSizeService.updateScreenSize(screenWidth);
    return MaterialApp(
      initialRoute: Routes.login, // Set the initial route
      onGenerateRoute: RouteManager.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: myThemeManager.getTheme(),
      title: 'Flutter Demo',
      // home: const JobApplicationViewScreen(),
    );
  }
}
