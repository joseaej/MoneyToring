import 'package:flutter/material.dart';

const Color ultralightGreen = Color(0xFF6CDB98);
const Color lightGreen = Color(0xFF4CD583);
const Color green = Color(0xFF2ECC40);
const Color darkGreen = Color(0xFF1B882A);
const Color ultraDarkGreen = Color(0xFF10601D);

const Color backgroundLight = Color(0xFFF7F9FA);
const Color backgroundDark = Color(0xFF23272A);
const Color background = Color.fromARGB(255, 29, 29, 31);
const Color backgroundBlack = Color.fromARGB(255, 21, 21, 22);
const Color backgroundTextField = Color.fromARGB(255, 34, 34, 37);
const Color font = Colors.white;
const Color lightGray = Colors.white60;
const Color darkfont = Color.fromARGB(221, 34, 34, 34);
const Color sliderOut = Color.fromARGB(255, 8, 5, 0);
const Color lightBackground = Color.fromARGB(255, 255, 255, 255);
const Color lightText = Color(0xFF000000);
const Color darkText = Colors.white;

const Color lightPrimary = Color(0xFF007BFF);
const Color darkPrimary = Color(0xFF1E88E5);
const Color errorColor = Color(0xFFD32F2F);
const Color successColor = Color(0xFF4CAF50);
const Color warningColor = Color(0xFFFFC107);
const Color grey600 = Color.fromARGB(255, 125, 125, 125);
const Color grey = Color.fromARGB(161, 175, 175, 175);

// Tema claro
ThemeData lightTheme = ThemeData(
  primaryColor: lightPrimary,
  scaffoldBackgroundColor: lightBackground,
  hintColor: grey600,
  primaryColorDark: Colors.blueGrey[700],
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: lightText),
    bodyMedium: TextStyle(color: Colors.grey[800]),
    headlineMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black), // ICONOS NEGROS EN LIGHT
    titleTextStyle: TextStyle(color: lightText, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: lightPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
  switchTheme: _switchTheme,
  iconTheme: IconThemeData(color: Colors.black), // ICONOS NORMALES NEGROS
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.black), // ICONOS DE BOTONES NEGROS
    ),
  ),
);

// Tema oscuro
ThemeData darkTheme = ThemeData(
  primaryColor: darkPrimary,
  scaffoldBackgroundColor: backgroundBlack, // Cambio para el fondo oscuro
  hintColor: background,
  primaryColorDark: Colors.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: darkText),
    bodyMedium: TextStyle(color: Colors.grey[300]),
    headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: background,
    iconTheme: IconThemeData(color: Colors.white), // ICONOS BLANCOS EN DARK
    titleTextStyle: TextStyle(color: darkText, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: darkPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
  switchTheme: _switchTheme,
  iconTheme: IconThemeData(color: Colors.white), // ICONOS NORMALES BLANCOS
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white), // ICONOS DE BOTONES BLANCOS
    ),
  ),
);

SwitchThemeData get _switchTheme => SwitchThemeData(
  thumbColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return Colors.white; // Color del thumb cuando esta activado.
    }
    return Colors.grey; // Color del thumb cuando esta desactivado.
  }),
  trackColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return Colors.blue; // Color del track cuando esta activado.
    }
    return Colors.grey[400]; // Color del track cuando esta desactivado.
  }),
  thumbIcon: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return Icon(
        Icons.dark_mode,
        color: lightGreen,
      ); // Icono cuando esta activado
    }
    return Icon(
      Icons.light_mode,
      color: lightGreen,
    ); // Icono cuando esta desactivado
  }),
);
