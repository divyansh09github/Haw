import 'package:shared_preferences/shared_preferences.dart';

class LockScreenHelper {
  static const String _lockKey = 'lock_enabled';

  static Future<bool> isLockEnabled() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_lockKey) ?? false;
  }

  static Future<void> setLockEnabled(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_lockKey, enabled);
  }
}
