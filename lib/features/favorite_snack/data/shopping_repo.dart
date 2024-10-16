import 'package:flutter/material.dart'; // Für die Verwendung von Icons
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';

class ShoppingRepo {
  final List<ShoppingItem> _items = [
    ShoppingItem(
      name: "Moglis's Cup",
      descriptionShort: "Strawberry ice cream",
      descriptionLong:
          "A delightful strawberry ice cream served in a playful cup. Made from the freshest strawberries and creamy milk, this treat is perfect for kids and adults alike. Indulge in the rich, fruity flavor and smooth texture that will make you smile.",
      price: 8.99,
      likes: 200,
      stars: 4.7,
      path: "assets/grafiken/cat cupcakes_3D.png",
      ingredients: [Icons.icecream, Icons.local_florist, Icons.spa],
    ),
    ShoppingItem(
      name: "Balu's Cup",
      descriptionShort: "Pistachio ice cream",
      descriptionLong:
          "Creamy pistachio ice cream served in a fun cup, made with roasted pistachios for a rich and nutty flavor. This classic treat offers a balance of smoothness and crunch, perfect for those who love a hint of luxury in their dessert.",
      price: 3.49,
      likes: 1876,
      stars: 4.5,
      path: "assets/grafiken/Ice.cream.png",
      ingredients: [Icons.icecream, Icons.grass],
    ),
    ShoppingItem(
      name: "Chick Cupcakes",
      descriptionShort: "Sweet chick-shaped cupcakes",
      descriptionLong:
          "Cute chick-shaped cupcakes that are not just for Easter! These fluffy vanilla cupcakes come with a rich buttercream frosting and are sure to be a hit at any gathering. Fun for kids, but adults will love them too!",
      price: 8.49,
      likes: 2891,
      stars: 4.6,
      path: "assets/grafiken/chick cupcakes_3D.png",
      ingredients: [Icons.cake, Icons.spa, Icons.flare],
    ),
    ShoppingItem(
      name: "Ice Cream Stick",
      descriptionShort: "Refreshing ice cream on a stick",
      descriptionLong:
          "A refreshing vanilla ice cream covered in a smooth chocolate coating, served on a stick for easy enjoyment. The perfect treat to cool down on a hot day, with a satisfying crunch from the outer shell and creamy goodness inside.",
      price: 4.99,
      likes: 5120,
      stars: 4.9,
      path: "assets/grafiken/ice cream stick_3D.png",
      ingredients: [Icons.icecream, Icons.ac_unit, Icons.emoji_food_beverage],
    ),
    ShoppingItem(
      name: "3D Ice Cream",
      descriptionShort: "Fancy 3D ice cream treat",
      descriptionLong:
          "This futuristic 3D ice cream treat comes in an array of vibrant colors and shapes. Each bite offers a surprising mix of flavors and textures, making it not only delicious but also fun to eat. A must-try for adventurous dessert lovers.",
      price: 5.99,
      likes: 4203,
      stars: 2.8,
      path: "assets/grafiken/Icecream_3D.png",
      ingredients: [Icons.icecream, Icons.nature, Icons.wb_sunny],
    ),
    ShoppingItem(
      name: "Angis's Yummy Burger",
      descriptionShort: "Delish vegan burger\nthat tastes like heaven",
      descriptionLong:
          "This delicious vegan burger is packed with flavor. A juicy plant-based patty is topped with fresh lettuce, tomatoes, and a tangy sauce, all sandwiched between a toasted bun. You won’t believe it’s vegan!",
      price: 13.99,
      likes: 4112,
      stars: 4.8,
      path: "assets/grafiken/Burger_3D.png",
      ingredients: [Icons.grass, Icons.eco, Icons.nature],
    ),
  ];

  List<ShoppingItem> getAllItems() => _items;
  ShoppingItem getItem(int index) =>
      index < _items.length ? _items[index] : _items[0];
}
