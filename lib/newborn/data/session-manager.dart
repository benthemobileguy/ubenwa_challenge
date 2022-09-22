import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String AUTH_TOKEN = "auth_token";
  static final SessionManager _instance = SessionManager._internal();

  static SessionManager get instance => _instance;

  late SharedPreferences sharedPreferences;

  // Named private constructor
  SessionManager._internal();

  factory SessionManager() {
    return _instance;
  }

  String get authToken => (sharedPreferences.getString(AUTH_TOKEN) ?? "");

  set authToken(String value) {
    sharedPreferences.setString(AUTH_TOKEN, value);
  }

  Future setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return Future.value();
  }
}
