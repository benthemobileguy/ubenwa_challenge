import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final String _baseUrl = "https://ubenwa-cat-api-stage.herokuapp.com/api/v1/";
  final Map<String, String>? headers = {"Content-Type": "application/json"};
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<http.Response> logIn({
    required String username,
    required String password,
  }) async {
    final response = await http.post(Uri.parse('$_baseUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": username.trim(),
          "password": password.trim(),
        }));
    if (response.statusCode == 200) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    return response;
  }

  Future<http.Response> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    final response = await http.post(Uri.parse('$_baseUrl/signup'),
        headers: headers,
        body: json.encode({
          "first_name": username.trim(),
          "password_confirmation": password.trim(),
          "email": email.trim(),
          "password": password.trim(),
        }));
    if (response.statusCode == 200) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    return response;
  }

  Future<void> logOut() async {
    try {
      final response =
          await http.delete(Uri.parse('$_baseUrl/logout'), headers: headers);
      _controller.add(AuthenticationStatus.unauthenticated);
    } catch (error) {}
  }

  void dispose() => _controller.close();
}
