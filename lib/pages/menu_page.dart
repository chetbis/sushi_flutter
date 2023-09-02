import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/actionable_card.dart';
import 'package:sushi/components/food_search_input.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/pages/food_details_page.dart';

import '../components/food_tile.dart';
import '../components/popular_food.dart';
import '../models/food.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final Food _popularFood = Food(
    name: 'Salmon Eggs',
    price: '21.00',
    id: 'food_3',
    imagePath: 'lib/images/fish_eggs.png',
    rating: '4.9',
  );

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
    final shopModel = context.read<Shop>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.grey[900],
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.cartPage,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
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
            const SizedBox(height: 20),
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
                itemCount: shopModel.foodItems.length,
                itemBuilder: (BuildContext context, int index) {
                  Food foodItem = shopModel.foodItems[index];
                  return FoodTile(
                    tag: foodItem.tag,
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
                tag: _popularFood.tag,
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
