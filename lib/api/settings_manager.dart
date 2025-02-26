import 'package:shared_preferences/shared_preferences.dart';

class SettingsManager {
  bool isNotificationsEnabled = false;
  bool isVibrationsEnabled = false;

  static Future<bool> getNotificationsBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isNotificationsEnabled') ?? false;
  }

  static Future<void> updatePreferences(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
}
