import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/core/screen_manager/screen_service_manager.dart';
import 'package:resume_app/core/theme_manager/theme_manager.dart';
import 'package:resume_app/features/auth/presentation/signup/presentation/singup_presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    MyTheme myThemeManager = instance<MyTheme>();
    ScreenSizeService screenSizeService = instance<ScreenSizeService>();
    screenSizeService.updateScreenSize(screenWidth);
    return MaterialApp(
      initialRoute: Routes.login, // Set the initial route
      onGenerateRoute: RouteManager.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: myThemeManager.getTheme(),
      title: 'Flutter Demo',
      // home: const SignUpPresentation(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
