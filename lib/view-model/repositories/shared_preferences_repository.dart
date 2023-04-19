import 'package:swc_challenge/model/service/shared_preferences.dart';

class SharedPreferenciesRepository {
  static Future<void> saveData(String data) async {
    SharedPreferencesService.saveData(data);
  }

  static Future<String?> retrieveData(String dataKey) async {
    String? data = await SharedPreferencesService.retrieveData(dataKey);
    return data;
  }
}
