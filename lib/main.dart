import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/screens/mainscreen.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/widgets/suggested_card.dart';
import 'package:ts_4_7_1_jpp_app/landing_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: LandingScreen(),
      ),
    );
  }
}

ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: "SF_Pro",
    textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 12, color: Colors.white70)));
