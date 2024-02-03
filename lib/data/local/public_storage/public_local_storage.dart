import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class PublicLocalStorage {
  final SharedPreferences sharedPreferences;
  PublicLocalStorage(this.sharedPreferences);

  Future<void> setBool(String key, bool isBool) async {
    await sharedPreferences.setBool(key, isBool);
  }

  Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  Future<void> deleteData(String key) async {
    await sharedPreferences.remove(key);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }
}
