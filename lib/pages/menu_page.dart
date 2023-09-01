import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/actionable_card.dart';
import 'package:sushi/components/food_search_input.dart';
import 'package:sushi/pages/food_details_page.dart';

import '../components/food_tile.dart';
import '../components/popular_food.dart';
import '../models/food.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  final Food _popularFood = const Food(
    name: 'Salmon Eggs',
    price: '21.00',
    imagePath: 'lib/images/fish_eggs.png',
    rating: '4.9',
  );

  final List<Food> _food = const [
    // Salmon sushi
    Food(
      name: 'Salmon Sushi',
      price: '20.00',
      imagePath: 'lib/images/pink_sushi.png',
      rating: '4.9',
    ),
    // tuna
    Food(
      name: 'Tuna',
      price: '40.00',
      rating: '5.0',
      imagePath: 'lib/images/multi_fish_eggs.png',
    ),
  ];

  _onFoodTileTapped(BuildContext context, Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(foodItem: food),
      ),
    );
  }

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
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const ActionableCard(
              actionBtnFontSize: 20,
              title: 'Get 32% Promo',
              actionBtnText: 'Redeem',
              assetImagePath: 'lib/images/multi_sushi.png',
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: FoodSearchInput(),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 30),
                scrollDirection: Axis.horizontal,
                itemCount: _food.length,
                itemBuilder: (BuildContext context, int index) {
                  Food foodItem = _food[index];
                  return FoodTile(
                    imagePath: foodItem.imagePath,
                    name: foodItem.name,
                    price: foodItem.price,
                    rating: foodItem.rating,
                    onTapped: () {
                      _onFoodTileTapped(context, foodItem);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: PopularFood(
                price: _popularFood.price,
                imagePath: _popularFood.imagePath,
                foodName: _popularFood.name,
                onTap: () {
                  _onFoodTileTapped(
                    context,
                    _popularFood,
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
