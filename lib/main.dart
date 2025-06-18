
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytoring/presentation/pages/auth/login_page.dart';
import 'package:moneytoring/presentation/pages/auth/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moneytoring/presentation/pages/home/home_page.dart';
import 'package:moneytoring/domain/providers/settings_provider.dart';
import 'package:moneytoring/presentation/pages/onboarding/onboarding_page.dart';
import 'package:moneytoring/presentation/pages/settings/settings_page.dart';
import 'package:moneytoring/app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox("settings");
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => SettingsProvider(),
            )
          ],
          child: Consumer<SettingsProvider>(
            builder: (context, value, child) {
              value.getSettings();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: (value.settings.isDarkTheme)
                    ? ThemeMode.dark
                    : ThemeMode.light,
                routes: {
                  '/login': (context) => LoginPage(),
                  '/register': (context) => RegisterPage(),
                  '/onboarding': (context) => OnBoardingPage(),
                  '/home': (context) => HomePage(),
                  '/settings': (context) => SettingsPage(),
                },
                initialRoute: '/home',
              );
            },
          ),
        );
      },
    );
  }
}
