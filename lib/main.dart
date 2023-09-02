import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/pages/intro_page.dart';
import 'package:sushi/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
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
        Routes.menuPage: (context) => MenuPage()
      },
    );
  }
}
