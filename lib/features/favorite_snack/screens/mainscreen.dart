import 'package:flutter/material.dart';
import 'dart:ui';
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

List<String> categorieNames = ["Salty", "Sweet", "Drinks", "Soft"];

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    ShoppingItem shoppingItem = widget.shoppingRepo.getItem(5);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/backgrounds/bg_mainscreen.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 48,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose Your Favorite \nSnack",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      CategoriesDropdown(),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 36,
                        width: 230,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return CategoriesButton(
                                  text: categorieNames[index],
                                  selected: true,
                                );
                              } else {
                                return CategoriesButton(
                                    text: categorieNames[index]);
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 8,
                              );
                            },
                            itemCount: categorieNames.length),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 50,
                  //   width: 400,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Center(
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Colors.amber),

                  //           width: 100,
                  //           //color: Colors.blue,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Text(
                  //               buttonsText[index],
                  //               style: TextStyle(fontSize: 12),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (BuildContext context, int index) {
                  //       return const SizedBox(
                  //         width: 4,
                  //       );
                  //     },
                  //     itemCount: buttonsText.length,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 32,
                  ),
                  SuggestedCard(item: shoppingItem),
                  const SizedBox(
                    height: 32,
                  ),
                  RecommendMainScreen(widget: widget)
                ],
              ),
            ),
          )

          //Buttonsheet(item: widget.shoppingRepo.getItem(1)),
          // Positioned(
          //     top: 200,
          //     child: Row(
          //       children: [SuggestedCard(item: widget.shoppingRepo.getItem(1))],
          //     )),
          // Positioned(
          //     top: 564,
          //     child: GestureDetector(
          //       onTap: () => showModalBottomSheet(
          //           backgroundColor: Colors.transparent,
          //           isScrollControlled: true,
          //           context: context,
          //           builder: (BuildContext context) {
          //             return Buttonsheet(item: shoppingItem);
          //           }),
          //       child: RecommenedCard(item: shoppingItem),
          //     ))
        ],
      ),
    );
  }
}

class RecommendMainScreen extends StatelessWidget {
  const RecommendMainScreen({
    super.key,
    required this.widget,
  });

  final Mainscreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "We Recommend",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 270,
          width: 390,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                        Buttonsheet(item: widget.shoppingRepo.getItem(index)),
                  ),
                  child:
                      RecommenedCard(item: widget.shoppingRepo.getItem(index)),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 24,
                );
              },
              itemCount: widget.shoppingRepo.getAllItems().length),
        ),
      ],
    );
  }
}

class CategoriesDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 0.1)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  color: Colors.white70,
                ),
                SizedBox(
                  width: 8,
                ),
                Text("All categories"),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({
    super.key,
    required this.text,
    this.selected = false,
  });
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
                color: selected ? const Color(0xFFEDC6E9) : Color(0xFFCC8AC9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 1)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal,
                        color: selected ? Colors.black : Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
