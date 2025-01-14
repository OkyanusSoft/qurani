import 'package:quran_app/core/constant.dart';
import 'package:quran_app/features/setting/logic/manage_notification_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await _prefs!.setString(key, value);
    if (value is bool) return await _prefs!.setBool(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    return await _prefs!.setDouble(key, value);
  }

  static int? getInt({required String key}) {
    return _prefs!.getInt(key);
  }

  static double? getDouble({required String key}) {
    return _prefs!.getDouble(key);
  }

  static String? getString({required String key}) {
    return _prefs!.getString(key);
  }

  static bool? getBool({required String key}) {
    return _prefs!.getBool(key);
  }

  static Future<bool> removeToken() {
    return _prefs!.clear();
  }
}

class CashConfig {
  static bool hasInitLocal = false;
  static Future<void> init() async {
    await CashHelper.init();
    await initLastPageRead();
    await initCurrentThemeType();
    await initHasInitLocal();

    //
    await ManageNotification.initNotification();
  }

  static Future<void> initLastPageRead() async {
    lastPageRead = CashHelper.getInt(key: 'lastPageRead') ?? 0;
  }

  static Future<void> initCurrentThemeType() async {
    currentThemeType = CashHelper.getInt(key: 'currentThemeType') ?? 0;
  }

  static Future<void> initHasInitLocal() async {
    hasInitLocal = CashHelper.getBool(key: 'hasInitLocal') ?? false;
  }

  //
  static void setLastRead() async {
    await CashHelper.setData(
      key: 'lastPageRead',
      value: lastPageRead,
    );
  }

  //notification
}
