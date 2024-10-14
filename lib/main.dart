import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/landing_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: LandingScreen(),
        ),
      ),
    );
  }
}
