import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/screens/mainscreen.dart';
import 'package:ts_4_7_1_jpp_app/shared/widgets.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/backgrounds/bg_startscreen.png",
              fit: BoxFit.cover,
              scale: 1,
            ),
          ),
          Positioned(
              top: 92,
              //left: 8,
              //right: 8,
              child: Image.asset("assets/grafiken/chick cupcakes_3D.png")),
          Positioned(
              top: 400,
              //left: 8,
              //right: 8,

              child: Image.asset(
                "assets/details/T2.png",
                fit: BoxFit.fitWidth,
                scale: 0.95,
              )),

          // Text und Button Overlay
          const OrderCard()
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 520,
      left: 20,
      right: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 30),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: Colors.black.withOpacity(0.1),
                //color: Colors.green,
                //shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 0.1),
              ),
              //child: Container(
              // decoration: BoxDecoration(
              //     border: Border.all(color: Color(0xFFEEDCF9))),
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Feeling Snackish Today?',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Explore Angi’s most popular snack selection\nand get instantly happy.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mainscreen()));
                    },

                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor:
                    //       Colors.pinkAccent, // Hintergrundfarbe
                    //   // padding: const EdgeInsets.symmetric(
                    //   //     horizontal: 30, vertical: 15),
                    //   // shape: RoundedRectangleBorder(
                    //   //   borderRadius: BorderRadius.circular(30),
                    //   // ),
                    // ),

                    child: const actionButton(text: "Order Now"),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
