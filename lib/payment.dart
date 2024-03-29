import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({required Key key}) : super(key: key); // Required key parameter

  @override
  State<Payment> createState() => _PaymentState();
}


class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Pay UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GooglePayScreen(),
    );
  }
}

class GooglePayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Pay'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google Pay Symbol
            Image.asset(
              'assets/gp.jpg', // Path to Google Pay symbol
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            // Transaction Details
            _buildTransactionDetails(),
            SizedBox(height: 20),
            // Pay Button
            ElevatedButton(
              onPressed: () {
                _handlePayment(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color changed to white
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.payment, size: 30),
                  SizedBox(width: 10),
                  Text('Pay with Google Pay'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Progress Indicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display transaction details
  Widget _buildTransactionDetails() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transaction Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Name: Aswathy',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Amount: 120',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Date: ${DateTime.now().toString().split(' ')[0]}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Function to handle payment
  void _handlePayment(BuildContext context) async {
    // Simulate API call to calculate fare based on bus passes taken
    int numPasses = 2; // Example: Number of bus passes taken
    int fare = await _calculateFare(numPasses);

    // Show payment success/failure dialog based on response
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Status'),
          content: Text('Payment send: $fare'), // Display the fare
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to simulate API call to calculate fare
  Future<int> _calculateFare(int numPasses) async {
    // In a real scenario, make an API call to your server
    // and calculate the fare based on the number of passes
    // Here, we'll use a simple logic to calculate fare
    switch (numPasses) {
      case 1:
        return 60;
      case 2:
        return 120;
      case 3:
        return 180;
      case 4:
        return 240;
      case 5:
        return 300;
      case 6:
        return 300;
      default:
        return 0;
    }
  }
}
