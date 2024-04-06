import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = 'http://localhost:3006/api/signup';

  Future<void> signup(String name, String admissionNo, String department, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'admissionNo': admissionNo,
        'department': department,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to sign up');
    }
  }
}
