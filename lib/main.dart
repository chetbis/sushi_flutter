import 'package:flutter/material.dart';
import 'package:sushi/pages/intro_page.dart';
import 'package:sushi/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const IntroPage(),
      routes: {
        '/intro-page': (context) => const IntroPage(),
        '/menu-page': (context) => const MenuPage(),
      },
    );
  }
}
