import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrRawValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        backgroundColor: const Color(0xFF5B7769), // Example app bar color
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context), // Go back
            icon: const Icon(Icons.qr_code_scanner),
            color: Colors.black, // Example icon color
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Data for QR Code', // Example label
                hintText: 'URL, Text, Contact Info, Etc', // Example hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  qrRawValue = value;
                });
              },
            ),
            if (qrRawValue != null)
              SizedBox(
                width: 300.0, // Example QR code width
                height: 300.0, // Example QR code height
                child: PrettyQrView.data(
                  data: qrRawValue!,
                ),
              ),
          ],
        ),
      )
    );
  }
}