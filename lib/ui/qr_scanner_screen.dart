import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B7769),
        title: const Text(
          "ScanNava",
          style: TextStyle(
          color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generator");
            },
            color: Colors.black,
            icon: const Icon(Icons.qr_code),
          )
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          // buat sekali ngeditek
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          // for itu kondisi nya berarti udh benar & rawValue itu yg untuk munculin sebuah teks/link dri gambar asli qr nya
          for (final barcode in barcodes) {
            print('Barcode is valid! ${barcode.rawValue}');
          }
          if (image != null) {
            showDialog(
              context: context,
              builder: (context) {
                // pop up notification
                return AlertDialog(
                  title: Text(
                    // Klo image nya ga null, dia akan munculin sebuah pop up beserta rawValue nya. Klo barcode kita kosong dia bakal ngereturn
                    // sprti kode yg dibawah ini
                    barcodes.first.rawValue ?? "no referance found from this QR Code",
                  ),
                  content: Image(
                    image: MemoryImage(image)
                  ),
                );
              }
            );
          }
        },
      ),
    );
  }
}