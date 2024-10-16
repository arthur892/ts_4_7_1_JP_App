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
                  borderRadius: BorderRadius.circular(16)),
              height: 800,
              width: 420,
              //color: Colors.black,
            )),
        Positioned(
          top: 0,
          child: Container(
            height: 320,
            //width: 280,

            //color: Colors.green,
            child: Image.asset(
              item.path,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 280,
            child: Column(
              children: [
                DetailsCard(
                  item: item,
                ),
                const SizedBox(height: 80),
                OrderCard(item: item)
              ],
            )),
        Positioned(
          top: 120,
          right: 0,
          child: IconButton(
              iconSize: 20,
              padding: const EdgeInsets.all(4),
              onPressed: () {
                Navigator.pop(context);
              },
              //color: Colors.white70,

              style: IconButton.styleFrom(
                minimumSize: const Size(16, 16),
                shape: const CircleBorder(
                    side: BorderSide(
                  color: Colors.white70,
                  width: 1,
                )),
                //backgroundColor: const Color(0xFF3C423D),
              ),
              icon: const Icon(
                Icons.close,
                color: Colors.white70,
              )),
        )
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.currency_yen_sharp,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        item.price.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
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

enum mySize { small, medium, large }

class _OrderCardState extends State<OrderCard> {
  final List<String> _options = ["Small", "Medium", "Large"];
  String _selectedSize = "Large";
  int counter = 1;
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
                      //maximumSize: Size(50, 50),
                      fixedSize: Size(12, 12),
                      minimumSize: Size(12, 12),
                      backgroundColor: const Color(0xFF414544),
                      foregroundColor: const Color(0xFF636366),
                      //textStyle: Theme.of(context).textTheme.bodyMedium,
                      selectedBackgroundColor: const Color(0xFF636366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(0)),
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
              const Expanded(child: Text("")),
              Row(
                children: [
                  IconButton(
                      iconSize: 20,
                      padding: const EdgeInsets.all(4),
                      onPressed: () => setState(() {
                            counter == 1 ? counter = 1 : counter--;
                          }),
                      //color: Colors.white70,

                      style: IconButton.styleFrom(
                        minimumSize: const Size(16, 16),
                        shape: const CircleBorder(
                            side: BorderSide(
                          color: Colors.white70,
                          width: 1,
                        )),
                        backgroundColor: const Color(0xFF3C423D),
                      ),
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white70,
                      )),
                  Container(
                    width: 32,
                    child: Center(
                        child: Text(
                      counter.toString(),
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  IconButton(
                      iconSize: 20,
                      padding: const EdgeInsets.all(4),
                      //constraints: BoxConstraints(minHeight: 32, minWidth: 32),
                      onPressed: () => setState(() {
                            counter++;
                          }),
                      //color: Colors.white70,
                      style: IconButton.styleFrom(
                        minimumSize: const Size(16, 16),
                        shape: const CircleBorder(
                            side: BorderSide(
                          color: Colors.white70,
                          width: 1,
                        )),
                        backgroundColor: const Color(0xFF3C423D),
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
        Container(
          //height: 36,
          width: 320,
          //constraints: BoxConstraints(minWidth: 200),

          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD3B9DE)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFFE970C4).withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 8,
                    offset: const Offset(0, 10))
              ],
              gradient: const LinearGradient(
                  colors: [Color(0xFFE970C4), Color(0xFFF59AA5)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Add to order for",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Icon(
                  Icons.currency_yen_sharp,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  widget.item.price.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
