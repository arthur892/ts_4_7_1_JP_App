import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/data/shopping_repo.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/widgets/recommend_card.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/widgets/suggested_card.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/widgets/button_sheet.dart';

class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});
  ShoppingRepo shoppingRepo = ShoppingRepo();

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    ShoppingItem shoppingItem = widget.shoppingRepo.getItem(0);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/backgrounds/bg_mainscreen.png",
              fit: BoxFit.cover,
            ),
          ),
          //Buttonsheet(item: widget.shoppingRepo.getItem(1)),
          Positioned(
              top: 200,
              child: Row(
                children: [SuggestedCard(item: widget.shoppingRepo.getItem(1))],
              )),
          Positioned(
              top: 564,
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Buttonsheet(item: shoppingItem);
                    }),
                child: RecommenedCard(item: shoppingItem),
              ))
        ],
      ),
    );
  }
}
