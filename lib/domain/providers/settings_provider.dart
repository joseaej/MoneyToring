import 'package:flutter/material.dart';
import 'package:moneytoring/domain/models/settings.dart';

class  SettingsProvider with ChangeNotifier {
  Settings settings = Settings.normal();

  void togleTheme(){
    settings.isDarkTheme = !settings.isDarkTheme;
    notifyListeners();
  }
}