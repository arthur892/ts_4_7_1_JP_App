import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.item,
  });

  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class LikesWidget extends StatelessWidget {
  const LikesWidget({
    super.key,
    required this.item,
  });

  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.favorite_border,
          size: 16,
          color: Colors.white70,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(item.likes.toStringAsFixed(0)),
      ],
    );
  }
}

class Ingrediens extends StatelessWidget {
  const Ingrediens({super.key, required this.item});
  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Ingrediens"),
        ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(item.ingredients.length, (int index) {
            return Icon(
              item.ingredients[index],
              color: Colors.white,
            );
          }),
        )
      ],
    );
  }
}
