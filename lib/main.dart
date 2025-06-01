import 'package:flutter/material.dart';
import 'package:moneytoring/auth/login_page.dart';
import 'package:moneytoring/auth/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
      initialRoute: '/login',
    );
  }
}
