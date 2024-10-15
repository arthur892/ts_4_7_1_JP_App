import 'package:flutter/material.dart'; // Für die Verwendung von Icons
import 'package:ts_4_7_1_jpp_app/features/favorite_snack/models/shopping_item.dart';

class ShoppingRepo {
  final List<ShoppingItem> _items = [
    ShoppingItem(
      name: "Moglis's Cup",
      descriptionShort: "Strawberry ice cream",
      descriptionLong:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus finibus mi a nisl vehicula, vitae posuere libero fermentum. Nulla facilisi. Integer feugiat dui ut dolor blandit, sed tristique massa pharetra. In finibus orci a turpis.",
      price: 8.99,
      likes: 200,
      stars: 4.7,
      path: "assets/grafiken/cat cupcakes_3D.png",
      ingredients: [Icons.icecream, Icons.local_florist, Icons.spa],
    ),
    ShoppingItem(
      name: "Angis's Yummy Burger",
      descriptionShort: "Delish vegan Burger\nthat tastes like heaven",
      descriptionLong:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus aliquet, lorem eget lacinia gravida, nisl odio egestas elit, in facilisis nulla erat vel est. Etiam tincidunt ultricies nisl nec suscipit. Fusce volutpat eros id libero.",
      price: 13.99,
      likes: 4112,
      stars: 4.8,
      path: "assets/grafiken/Burger_3D.png",
      ingredients: [Icons.grass, Icons.eco, Icons.nature],
    ),
    ShoppingItem(
      name: "Chick Cupcakes",
      descriptionShort: "Sweet chick-shaped cupcakes",
      descriptionLong:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit feugiat elit, vel commodo justo. Fusce vitae diam quis justo cursus congue. Morbi nec libero eu odio ullamcorper condimentum. Sed at ante non metus suscipit rhoncus.",
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at diam dapibus, laoreet justo at, viverra dui. Maecenas pharetra facilisis orci, eu tincidunt erat ornare ac. Duis ac velit tempor, faucibus orci quis, mollis libero.",
      price: 4.99,
      likes: 5120,
      stars: 4.9,
      path: "assets/grafiken/ice cream stick_3D.png",
      ingredients: [Icons.icecream, Icons.ac_unit, Icons.emoji_food_beverage],
    ),
    ShoppingItem(
      name: "Ice Cream",
      descriptionShort: "Classic ice cream in a cone",
      descriptionLong:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit fringilla justo et dictum. Cras sagittis venenatis ipsum, id facilisis eros. Praesent at velit nibh. Integer egestas ultricies turpis, sed posuere risus consequat ac.",
      price: 3.49,
      likes: 1876,
      stars: 4.5,
      path: "assets/grafiken/Ice.cream.png",
      ingredients: [Icons.icecream, Icons.grass],
    ),
    ShoppingItem(
      name: "3D Ice Cream",
      descriptionShort: "Fancy 3D ice cream treat",
      descriptionLong:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed leo a metus tincidunt rhoncus id et nisi. Nullam posuere mi quis urna sodales posuere. In et erat a metus eleifend gravida. Ut condimentum nisi at eros.",
      price: 5.99,
      likes: 4203,
      stars: 4.8,
      path: "assets/grafiken/Icecream_3D.png",
      ingredients: [Icons.icecream, Icons.nature, Icons.wb_sunny],
    ),
  ];

  List<ShoppingItem> getAllItems() => _items;
  ShoppingItem getItem(int index) =>
      index < _items.length ? _items[index] : _items[0];
}
