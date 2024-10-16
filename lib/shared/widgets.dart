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
      //mainAxisAlignment: MainAxisAlignment.start,
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

class actionButton extends StatelessWidget {
  final double width;
  final String text;
  const actionButton({
    super.key,
    this.width = 180,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 36,
      width: width,
      //constraints: BoxConstraints(minWidth: 200),

      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD3B9DE)),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFE970C4).withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(0, 10))
          ],
          gradient: const LinearGradient(
              colors: [Color(0xFFE970C4), Color(0xFFF59AA5)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
