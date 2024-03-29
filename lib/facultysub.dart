import 'package:flutter/material.dart';

class FacultySub extends StatefulWidget {
  const FacultySub({Key? key}) : super(key: key);

  @override
  State<FacultySub> createState() => _FacultySubState();
}

class _FacultySubState extends State<FacultySub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Request Form to Have Bus',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Container for input fields
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildFormField('Name of the Student', Icons.person),
                        SizedBox(height: 10),
                        _buildFormField('Department', Icons.school),
                        SizedBox(height: 10),
                        _buildFormField('Reason to Have Bus', Icons.info, largeText: true),
                        SizedBox(height: 10),
                        _buildFormField('HOD Mail ID', Icons.email),
                        SizedBox(height: 10),
                        _buildFormField('Tutor Mail ID', Icons.email),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Submit button action
                    },
                    child: Text('Submit', style: TextStyle(fontSize: 18)), // Adjusted button text size
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.blue, // Set button background color to blue
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String labelText, IconData iconData, {bool largeText = false}) {
    return Row(
      children: [
        Icon(iconData, color: Colors.grey),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: labelText,
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: largeText ? 18 : 14), // Adjusted text size
          ),
        ),
      ],
    );
  }
}
