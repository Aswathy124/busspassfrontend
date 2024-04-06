import 'dart:convert';
import 'package:buspass/models/demoModel.dart';
import 'package:http/http.dart' as http;


class APIService {
  final String baseUrl = 'http://localhost:3006/api/login'; // Replace with your backend URL

  Future<Signup> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return Signup.fromJson(jsonDecode(response.body)['userdata']);
    } else {
      throw Exception('Failed to login');
    }
  }
}
