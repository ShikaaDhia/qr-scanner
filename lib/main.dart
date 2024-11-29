import 'package:flutter/material.dart';
import 'package:qr_scanner/splash_screen.dart';
import 'package:qr_scanner/ui/qr_generator_screen.dart';
import 'package:qr_scanner/ui/qr_scanner_screen.dart';

void main() {
  runApp(const QrScannerApp());
}

class QrScannerApp extends StatelessWidget {
  const QrScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR Scanner App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/scanner": (context) => const QrScannerScreen(),
        "/generator": (context) => const QrGeneratorScreen()
      },
    );
  }
}