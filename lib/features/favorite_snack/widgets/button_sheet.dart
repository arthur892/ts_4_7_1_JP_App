import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';
import 'package:ts_4_7_1_jpp_app/shared/widgets.dart';

class Buttonsheet extends StatefulWidget {
  const Buttonsheet({super.key, required this.item});
  final ShoppingItem item;

  @override
  State<Buttonsheet> createState() => _ButtonsheetState();
}

class _ButtonsheetState extends State<Buttonsheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            color: Colors.green,
            child: Image.asset(
              widget.item.path,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: 250,
            child: DetailsCard(
              item: widget.item,
            )),
        Positioned(
            top: 600,
            child: OrderCard(
              item: widget.item,
            ))
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
      width: 380,
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
                    style: Theme.of(context).textTheme.bodyLarge,
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
          //decoration: BoxDecoration(color: Colors.amber),
          child: SegmentedButton(
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
        )

        // ToggleButtons(
        //     isSelected: List.generate(
        //         _options.length, (index) => index == _selectedIndex),
        //     children: [])
      ],
    );
  }
}
