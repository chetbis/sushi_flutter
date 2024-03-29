import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/pages/cart_page.dart';
import 'package:sushi/pages/intro_page.dart';
import 'package:sushi/pages/menu_page.dart';
import 'package:sushi/theme/colors.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: secondaryColor,
        ),
        textTheme: GoogleFonts.dmSerifDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Tokyo Sushi',
      home: const IntroPage(),
      routes: {
        Routes.introPage: (context) => const IntroPage(),
        Routes.menuPage: (context) => MenuPage(),
        Routes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
