import 'package:flutter/material.dart';

class PaymentFee extends StatefulWidget {
  const PaymentFee({Key? key});

  @override
  State<PaymentFee> createState() => _PaymentFeeState();
}

class _PaymentFeeState extends State<PaymentFee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gp.jpg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            _buildTransactionDetails(), // Transaction Details
            SizedBox(height: 20),
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
                  color: Colors.white,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.payment, size: 30),
                  SizedBox(width: 10),
                  Text('Pay Now'),
                ],
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

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
            'Bus Pass Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Duration: 6 Months',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Route: Thrissur to FISAT',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Total Amount: ₹20,000',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _handlePayment(BuildContext context) async {
    int fare = 20000; // Total amount to pay

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Status'),
          content: Text('Payment Successful: ₹$fare'), // Display the fare
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
}
