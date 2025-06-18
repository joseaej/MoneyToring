import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytoring/domain/models/settings.dart';

class SettingsProvider with ChangeNotifier {
  Settings settings = Settings.normal();

  void saveSettings() async {
    final box = Hive.box("settings");
    await box.putAll(settings.toMap());
  }

  void clearSettings() async {
    final box = Hive.box("settings");
    await box.clear();
  }

  void getSettings() {
    final box = Hive.box("settings");
    if (box.isNotEmpty) {
      settings = Settings.fromMap(box.toMap());
    }
  }

  void togleTheme() {
    settings.isDarkTheme = !settings.isDarkTheme;
    notifyListeners();
  }
}
