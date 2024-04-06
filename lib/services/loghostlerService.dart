// login_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/loghostlerModel.dart';

class LoginService {
  static Future<String?> login(LoginModel loginModel) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3006/api/login/login'), // Replace with your backend URL
        body: json.encode(loginModel.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          return null; // No error
        } else {
          return responseData['status']; // Return error message
        }
      } else {
        return 'Failed to login. Please try again.';
      }
    } catch (e) {
      return 'An error occurred. Please try again later.';
    }
  }
}
