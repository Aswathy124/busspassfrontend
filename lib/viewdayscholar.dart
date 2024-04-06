import 'package:flutter/material.dart';

class ViewDayscholar extends StatelessWidget {
  final String name;
  final String department;
  final String admissionNo;
  final String place;
  final String busNo;

  const ViewDayscholar({
    Key? key,
    required this.name,
    required this.department,
    required this.admissionNo,
    required this.place,
    required this.busNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color of Scaffold
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8, // Set the width of the container
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.purple], // Set gradient colors
                ),
                borderRadius: BorderRadius.circular(20), // Add border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONSESSION CARD',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Name: $name'),
                    Text('Department: $department'),
                    Text('Admission No: $admissionNo'),
                    Text('Place: $place'),
                    Text('Bus No: $busNo'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DownloadPage()),
          );
        },
        child: Icon(Icons.file_download),
        backgroundColor: Colors.blue,
      ),
      extendBodyBehindAppBar: true, // Extend body behind AppBar
    );
  }
}

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Page'),
      ),
      body: Center(
        child: Text('This is the download page'),
      ),
    );
  }
}