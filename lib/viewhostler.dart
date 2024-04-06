import 'package:flutter/material.dart';
import 'package:buspass/models/buspassregister.dart';

class ViewHostler extends StatelessWidget {
  final BusPassModel busPass;

  const ViewHostler({Key? key, required this.busPass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.purple], // Set gradient colors
            ),
          ),
        ),
        title: Text(
          'BUS PASS',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set back icon color to white
      ),
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
                      'BUS PASS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20), // Add some space between title and details
                    Text('Name: ${busPass.name}', style: TextStyle(color: Colors.white)),
                    Text('Department: ${busPass.department}', style: TextStyle(color: Colors.white)),
                    Text('Admission No: ${busPass.admissionNo}', style: TextStyle(color: Colors.white)),
                    Text('From: ${busPass.from}', style: TextStyle(color: Colors.white)),
                    Text('To: ${busPass.to}', style: TextStyle(color: Colors.white)),
                    Text('Number of Passes: ${busPass.numberOfPasses}', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Add space between containers
            // Add more containers as needed
            Spacer(), // Add spacer to push the button to the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.payment, // Pay icon
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Pay',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
