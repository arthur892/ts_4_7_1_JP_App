import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';
import 'dart:math' as math;

import 'package:ts_4_7_1_jpp_app/shared/widgets.dart';

class SuggestedCard extends StatelessWidget {
  const SuggestedCard({super.key, required this.item});
  final ShoppingItem item;
  static const double degrees2Radians = math.pi / 180;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 380,
      //color: Colors.blue,
      child: Stack(
        children: [
          //Hintergrundbild
          ClipRRect(
            //borderRadius: BorderRadius.only(topRight: Radius.circular(26)),
            child: Container(
              height: 250,
              width: 380,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/details/Top Card.png",
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          // Positioned(
          //   child: Transform(
          //     alignment: FractionalOffset.center,
          //     transform: Matrix4.identity()
          //       ..setEntry(3, 2, 0.001)
          //       ..rotateY(-degrees2Radians * 60)
          //     //..rotateZ(0.5)
          //     //..rotateX(degrees2Radians * -15)
          //     ,
          //     child: Container(
          //       height: 250,
          //       width: 380,
          //       color: Colors.green,
          //     ),
          //   ),
          // ),
          //Inhalt + Button
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 32, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Image.asset("assets/grafiken/star.png"),
                    Text(
                      item.stars.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                Text(
                  item.descriptionShort,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                PriceWidget(
                  item: item,
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                TextButton(
                  onPressed: () {},

                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor:
                  //       Colors.pinkAccent, // Hintergrundfarbe
                  //   // padding: const EdgeInsets.symmetric(
                  //   //     horizontal: 30, vertical: 15),
                  //   // shape: RoundedRectangleBorder(
                  //   //   borderRadius: BorderRadius.circular(30),
                  //   // ),
                  // ),

                  child: Container(
                    //height: 36,
                    width: 100,
                    //constraints: BoxConstraints(minWidth: 200),

                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD3B9DE)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFFbf73bb).withOpacity(0.3),
                              spreadRadius: 4,
                              blurRadius: 8,
                              offset: Offset(0, 10))
                        ],
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 201, 141, 225),
                              Color(0xFF7554BD)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.3, 1.2]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Add to order",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // )
              ],
            ),
          ),

          //Grafik
          Positioned(
              right: 20,
              bottom: 0,
              child: Container(
                height: 180,
                child: Image.asset(
                  item.path,
                  fit: BoxFit.fitHeight,
                ),
              ))
        ],
      ),
    );
  }
}
