import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // buat durasi
    );

    // ngedefinisiin animasi nya (fade-in: dari 0 ke 1)
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // ngejalanin animasi
    _controller.forward();

    // buat pindah ke halaman utama stlh animasi nya selesai
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        "/scanner"
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // ngeberentiin animasi pas widget nya diapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeTransition(
        opacity: _animation, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo-splash.png',
                height: 150,
              ), 
              const SizedBox(height: 10),
              const Text(
                "ScanNova",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
