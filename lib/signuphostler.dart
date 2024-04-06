import 'package:buspass/buspass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String? _selectedDepartment;

  Future<void> _signup() async {
    if (_signUpFormKey.currentState!.validate()) {
      final String name = _nameController.text;
      final String admissionNo = _admissionNoController.text;
      final String department = _selectedDepartment ?? '';
      final String email = _emailController.text;
      final String password = _passwordController.text;

      final response = await http.post(
        Uri.parse('http://localhost:3006/api/signup/signup'),
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

      if (response.statusCode == 201) {
        // Signup successful, show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup Successful'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to new page upon successful login
        Navigator.push(context, MaterialPageRoute(builder: (context) => BusPass()));
      } else {
        // Signup failed, show error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Signup Failed'),
            content: Text('Failed to create user. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Hide the app bar
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30.0),
                    Text(
                      "  SIGN UP",
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
                          DropdownButtonFormField<String>(
                            value: _selectedDepartment,
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
                            items: [
                              'B.Tech 1st Year',
                              'B.Tech 2nd Year',
                              'B.Tech 3rd Year',
                              'B.Tech 4th Year',
                              'Mtech 1st Year',
                              'Mtech 2nd Year',
                              'MCA 1st Year',
                              'MCA 2nd Year',
                              'MBA 1st Year',
                              'MBA 2nd Year',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedDepartment = value;
                              });
                            },
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
                          SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: _signup,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
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
          Positioned(
            top: 20.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
