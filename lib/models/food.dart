import 'package:flutter/material.dart';

class Food {
  final UniqueKey tag = UniqueKey();
  final String id;
  final String name;
  final String price;
  final String imagePath;
  final String rating;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

}
