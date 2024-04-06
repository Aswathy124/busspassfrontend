import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:buspass/register fee.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _admissionNoController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {
    final url = Uri.parse('http://localhost:3006/api/signday/signday');
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': _nameController.text,
          'admissionNo': _admissionNoController.text,
          'department': _departmentController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        // Handle successful sign up
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully signed up!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Register()),
        );
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.reasonPhrase}')),
        );
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove app bar shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity, // Make container take up entire height of the screen
        width: double.infinity, // Make container take up entire width of the screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image1.jpg'),
            fit: BoxFit.cover, // Make background image cover the entire screen
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 30.0),
                      Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _admissionNoController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your admission number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Admission No',
                                prefixIcon: Icon(Icons.confirmation_number),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _departmentController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your department';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Department',
                                prefixIcon: Icon(Icons.business),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUp();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                              ),
                              child: Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
