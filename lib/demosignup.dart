import 'package:flutter/material.dart';

class DemoSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Center(
        child: Text(
          'This is the Demo Signup Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
