import 'package:flutter/material.dart';

class ShoppingItem {
  final String name;
  final String descriptionShort;
  final String descriptionLong;
  final double price;
  final int likes;
  final double stars;
  final String path;
  final List<IconData> ingredients;

  ShoppingItem(
      {required this.name,
      required this.descriptionShort,
      required this.descriptionLong,
      required this.price,
      required this.likes,
      required this.stars,
      required this.path,
      required this.ingredients});

  String getDescriptionLineBreak() {
    int cutCharAt = 20;
    String myString = "";

    descriptionShort[0];

    return "";
  }
}
