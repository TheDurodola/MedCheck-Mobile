import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {

  final String baseUrl = "http://10.0.2.2:8080/api/auth";


  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {

        return true;
      } else {

        throw Exception("Login failed: ${response.body}");
      }
    } catch (e) {
      throw Exception("Connection Error: $e");
    }
  }


  Future<bool> register(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "fullName": name,
          "email": email,
          "password": password,
        }),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      throw Exception("Registration Error: $e");
    }
  }
}