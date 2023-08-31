import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/actionable_card.dart';

import '../components/food_tile.dart';
import '../models/food.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  final List<Food> _food = const [
    // Salmon sushi
    Food(
      name: 'Salmon Sushi',
      price: '20',
      imagePath: 'lib/images/multi_fish_eggs.png',
      rating: '4.9',
    ),
    // tuna
    Food(
      name: 'Tuna',
      price: '40',
      imagePath: 'lib/images/pink_sushi.png',
      rating: '5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text(
          'Tokyo',
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[900],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ActionableCard(
              title: 'Get 32% Promo',
              actionBtnText: 'Redeem',
              assetImagePath: 'lib/images/multi_sushi.png',
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Food Menu',
                style: GoogleFonts.dmSerifDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 250,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 30);
                },
                scrollDirection: Axis.horizontal,
                itemCount: _food.length + 2,
                // 2 for starting and ending space,
                itemBuilder: (BuildContext context, int index) {

                  if (index == 0 || index == (_food.length + 1)) {
                    return const SizedBox(width: 10);
                  }

                  Food foodItem = _food[index - 1];

                  return FoodTile(
                    imagePath: foodItem.imagePath,
                    name: foodItem.name,
                    price: foodItem.price,
                    rating: foodItem.rating
                  );
                },
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
