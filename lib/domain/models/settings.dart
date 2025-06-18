import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  @HiveField(0)
  bool isDarkTheme = false;
  @HiveField(1)
  bool isNotificationsOn = false;

  Settings(
    this.isDarkTheme,
    this.isNotificationsOn,
  );
  Settings.normal() {
    isDarkTheme = false;
    isNotificationsOn = false;
  }
  Settings.fromMap(Map<dynamic, dynamic> map)
      : isDarkTheme = map['isDarkMode'],
        isNotificationsOn = map['isNotisOn'];

  Map<String, dynamic> toMap() {
    return {
      'isDarkMode': isDarkTheme,
      'isNotisOn': isNotificationsOn,
    };
  }

  Settings copyWith({
    bool? isDarkMode,
    bool? isNotisOn,
  }) {
    return Settings(isDarkMode ?? isDarkTheme, isNotisOn ?? isNotificationsOn);
  }
}
