import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPhotoKey = "USERPHOTOKEY";
  static String displayNameKey = "DISPLAYNAMEKEY";

  Future<bool> saveUserId(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userIdKey, userId);
  }

  Future<bool> saveuserEmail(String userEmail) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userEmailKey, userEmail);
  }

  Future<bool> saveuserName(String userName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userNameKey, userName);
  }

  Future<bool> saveuserPhoto(String userphoto) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userPhotoKey, userphoto);
  }

  Future<bool> saveDisplayName(String displayName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(displayNameKey, displayName);
  }

  Future<String?> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userIdKey);
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getUserPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userPhotoKey);
  }

  Future<String?> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(displayNameKey);
  }
}
