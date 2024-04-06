import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PdfForm(),
  ));
}

class PdfForm extends StatefulWidget {
  const PdfForm({Key? key}) : super(key: key);

  @override
  State<PdfForm> createState() => _PdfFormState();
}

class _PdfFormState extends State<PdfForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController admissionNoController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: admissionNoController,
              decoration: InputDecoration(labelText: 'Admission No'),
            ),
            TextField(
              controller: fromDateController,
              decoration: InputDecoration(labelText: 'From Date'),
            ),
            TextField(
              controller: toDateController,
              decoration: InputDecoration(labelText: 'To Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generatePDF();
              },
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }

  void generatePDF() {
    // Get data from text controllers
    String name = nameController.text;
    String department = departmentController.text;
    String admissionNo = admissionNoController.text;
    String fromDate = fromDateController.text;
    String toDate = toDateController.text;

    // Generate PDF document using the entered data
    // Implement PDF generation logic here
    // You can use the data to create a PDF document using the 'pdf' package or any other suitable package

    // For now, just print the entered data
    print('Name: $name');
    print('Department: $department');
    print('Admission No: $admissionNo');
    print('From Date: $fromDate');
    print('To Date: $toDate');
  }
}
