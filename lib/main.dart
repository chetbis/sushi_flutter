import 'package:flutter/material.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/pages/food_details_page.dart';
import 'package:sushi/pages/intro_page.dart';
import 'package:sushi/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokyo Sushi',
      home: const IntroPage(),
      routes: {
        Routes.introPage: (context) => const IntroPage(),
        Routes.menuPage: (context) => const MenuPage(),
        Routes.foodDetailsPage: (context) => const FoodDetailsPage(),
      },
    );
  }
}
