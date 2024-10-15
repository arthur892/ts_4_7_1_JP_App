import 'package:flutter/material.dart';
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';
import 'package:ts_4_7_1_jpp_app/shared/widgets.dart';

class RecommenedCard extends StatelessWidget {
  const RecommenedCard({super.key, required this.item});
  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD3B9DE)),
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.15, 0.5, 0.75],
            colors: [
              Color(0xFF5E5D64),
              Color(0xFF776EC1),
              Color(0xFF7554BD),
            ],
          ),
        ),

        //height: 300,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.path,
                fit: BoxFit.cover,
              ),
              Text(
                item.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                item.descriptionShort,
                //style: Theme.of(context).textTheme.bodyMedium
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.currency_yen_sharp,
                    color: Colors.white70,
                    size: 20,
                  ),
                  Expanded(
                      child: Text(
                    item.price.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
                  LikesWidget(item: item),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
