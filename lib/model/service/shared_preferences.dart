import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static void saveData(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('value', value);
  }

  static Future<String?> retrieveData(String valueKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(valueKey);

    return value;
  }
}
