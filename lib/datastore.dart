import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  // Save form data to SharedPreferences
  static Future<void> saveFormData({required String name,required password, required String mobile}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('mobile', mobile);
    await prefs.setString('password', password);
  }


  static Future<Map<String, String?>> getFormData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name'),
      'mobile': prefs.getString('mobile'),
      'password': prefs.getString('password'),
    };
  }
}
