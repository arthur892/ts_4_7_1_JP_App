import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';
import 'package:ts_4_7_1_jpp_app/shared/widgets.dart';

const double maxWidth = 380;

class Buttonsheet extends StatelessWidget {
  const Buttonsheet({super.key, required this.item});
  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 120,
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF2F2B22),
                      //Color(0xFF2F2B22),
                      Color(0xFF354343)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.60, 1],
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8)),
              height: 800,
              width: 420,
              //color: Colors.black,
            )),
        Positioned(
          top: 0,
          child: Container(
            //height: 200,
            width: 320,

            //color: Colors.green,
            child: Image.asset(
              item.path,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
            top: 312,
            child: Column(
              children: [
                DetailsCard(
                  item: item,
                ),
                SizedBox(height: 40),
                OrderCard(item: item)
              ],
            )),
        // Positioned(
        //     top: 600,
        //     child: OrderCard(
        //       item: item,
        //     ))
      ],
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.item});
  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      width: maxWidth,
      //color: Colors.red,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 0.1)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      LikesWidget(
                        item: item,
                      ),
                    ],
                  ),
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    item.descriptionLong,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  PriceWidget(item: item),
                  const Divider(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ingrediens",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                                children: List.generate(item.ingredients.length,
                                    (int index) {
                              return Icon(
                                item.ingredients[index],
                                color: Colors.white70,
                              );
                            })),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Reviews"),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Row(
                                  children: List.generate(5, (int index) {
                                if (index + 1 < item.stars) {
                                  return const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.white70,
                                  );
                                } else {
                                  return const Icon(
                                    size: 16,
                                    Icons.star_border,
                                    color: Colors.white70,
                                  );
                                }
                              })),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(item.stars.toStringAsFixed(1)),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.item});
  final ShoppingItem item;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

enum Size { small, medium, large }

class _OrderCardState extends State<OrderCard> {
  final List<String> _options = ["Small", "Medium", "Large"];
  String _selectedSize = "Large";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: maxWidth,
          child: Row(
            children: [
              SegmentedButton(
                  style: SegmentedButton.styleFrom(
                      backgroundColor: Color(0xFF414544),
                      foregroundColor: Color(0xFF636366),
                      //textStyle: Theme.of(context).textTheme.bodyMedium,
                      selectedBackgroundColor: Color(0xFF636366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(0)),
                  showSelectedIcon: false,
                  segments: <ButtonSegment<String>>[
                    ButtonSegment<String>(
                        value: _options[0],
                        label: Text(
                          _options[0],
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    ButtonSegment<String>(
                        value: _options[1],
                        label: Text(
                          _options[1],
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    ButtonSegment<String>(
                        value: _options[2],
                        label: Text(
                          _options[2],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                  ],
                  selected: <String>{_selectedSize},
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      _selectedSize = newSelection.first;
                      print(_selectedSize);
                    });
                  }),
              Expanded(child: Text("")),
              Row(
                children: [
                  IconButton(
                      iconSize: 20,
                      onPressed: () => null,
                      //color: Colors.white70,
                      style: IconButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                          color: Colors.white70,
                          width: 1,
                        )),
                        backgroundColor: Color(0xFF3C423D),
                      ),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white70,
                      )),
                  Container(
                    width: 40,
                    child: Center(
                        child: Text(
                      "1",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
                  ),
                  IconButton(
                      iconSize: 20,
                      //constraints: BoxConstraints(minHeight: 32, minWidth: 32),
                      onPressed: () => null,
                      //color: Colors.white70,
                      style: IconButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                          color: Colors.white70,
                          width: 1,
                        )),
                        backgroundColor: Color(0xFF3C423D),
                      ),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white70,
                      ))
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        actionButton(
          text: "Add to order for " + widget.item.price.toString(),
          width: 320,
        )
      ],
    );
  }
}
