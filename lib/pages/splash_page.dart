import 'package:flutter/material.dart';
import 'dart:async'; // 🔴 1. นำเข้าไลบรารีสำหรับตั้งเวลา
import 'login_page.dart'; 

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryDark = const Color(0xFF4A3B52);
    final Color bgColor = const Color(0xFFF8F8F8);

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/logo.png',
              width: 180, 
              height: 180,
            ),
            const SizedBox(height: 20),
            Text(
              '3D NOW',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: primaryDark,
                letterSpacing: 2.0, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}