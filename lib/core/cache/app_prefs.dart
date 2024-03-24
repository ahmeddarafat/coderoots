import 'package:shared_preferences/shared_preferences.dart';

import 'prefs_keys.dart';

class AppPrefs {
  final SharedPreferences _sharedPrefs;
  AppPrefs(this._sharedPrefs);

  /// Token
  Future<void> setToken(String token) async {
    await _sharedPrefs.setString(PrefsKeys.token, token);
  }

  String getToken() {
    return _sharedPrefs.getString(PrefsKeys.token) ?? "Unknown";
  }

  Future<void> removeToken() async {
    await _sharedPrefs.remove(PrefsKeys.token);
  }

  void clear() {
    _sharedPrefs.clear();
  }
}
