import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpService {
  static Future<void> signUp(
      String name,
      String admissionNo,
      String department,
      String email,
      String password,
      ) async {
    final url = Uri.parse('http://localhost:3006/api/signday/signday');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': name,
          'admissionNo': admissionNo,
          'department': department,
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        // Handle successful sign up
      } else {
        // Handle error
        throw Exception('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle error
      throw Exception('Error: $error');
    }
  }
}
