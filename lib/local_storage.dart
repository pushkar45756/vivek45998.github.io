import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static String isLoggedIn = 'isLoggedIn';
  static String isFirstInstalled = 'isFirstInstalled';
  static String isFirstSignIn = 'isFirstSignIn';
  static String userId = 'userId';
  static String userData = 'userData';
  static String userType = 'userType';
  static String isRefresh = "isRefresh";
  static String email="email";
  static String user="user";
  static String projectData="projectData";
  static String loginBearerToken="loginBearerToken";


  static final _box = GetStorage();

  static void saveData(dynamic key, var value) {
    _box.write(key, value);
  }

  static dynamic getData(dynamic key) {
    return _box.read(key);
  }
  static dynamic remove(dynamic key) {
    return _box.remove(key);
  }
  static void clearUserData() {
    saveData(userData, null);
  }

  static void clearStorage() {
    _box.erase();
  }
}