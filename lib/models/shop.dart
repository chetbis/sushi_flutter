import 'package:flutter/material.dart';

import 'food.dart';

class Shop with ChangeNotifier {
  final Map<String, Food> _foodItemsEntities = {
    'food_1': Food(
      id: 'food_1',
      name: 'Salmon Sushi',
      price: '20.00',
      imagePath: 'lib/images/pink_sushi.png',
      rating: '4.9',
    ),
    'food_2': Food(
      id: 'food_2',
      name: 'Tuna',
      price: '40.00',
      rating: '5.0',
      imagePath: 'lib/images/multi_fish_eggs.png',
    ),
    'food_3': Food(
      name: 'Salmon Eggs',
      price: '21.00',
      id: 'food_3',
      imagePath: 'lib/images/fish_eggs.png',
      rating: '4.9',
    )
  };

  final String _popularFood = 'food_3';

  List<String> _cartItems = [];

  List<Food> get foodItems {
    return _foodItemsEntities.entries.map((entry) => entry.value).toList();
  }

  Food? get popularFood {
    if (_foodItemExists(_popularFood)) {
      return _foodItemsEntities[_popularFood];
    }
    return null;
  }

  List<Food> get shopItems {
    return _cartItems.fold(
      [],
      (foodItems, foodItemKey) {
        List<Food> newFoodItems = [...foodItems];
        if (_foodItemsEntities.containsKey(foodItemKey)) {
          newFoodItems.add(_foodItemsEntities[foodItemKey]!);
        }
        return newFoodItems;
      },
    );
  }

  _foodItemExists(String itemId) {
    return _foodItemsEntities.containsKey(itemId);
  }

  /// add items to the shopping cart
  addToCart(String itemId, int quantity) {
    if (!_foodItemExists(itemId)) return;
    for (int i = 0; i < quantity; i++) {
      _cartItems.add(itemId);
    }
    notifyListeners();
  }

  /// removes an item from the shopping cart
  removeFromCart(String itemId) {
    if (!_foodItemExists(itemId)) return;
    _cartItems = _cartItems.where((element) => element != itemId).toList();
    notifyListeners();
  }
}
