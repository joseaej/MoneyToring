import 'package:flutter/material.dart';
import 'package:moneytoring/auth/login_page.dart';
import 'package:moneytoring/auth/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moneytoring/home/home_page.dart';
import 'package:moneytoring/onboarding/onboarding_page.dart';
import 'package:moneytoring/settings/settings_page.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          routes: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/onboarding': (context) => OnBoardingPage(),
            '/home': (context) => HomePage(),
            '/settings': (context) => SettingsPage(),
          },
          initialRoute: '/onboarding',
        );
      },
    );
  }
}
