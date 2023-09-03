import 'package:flutter/material.dart';

import 'food.dart';

class Shop with ChangeNotifier {
  final Map<String, Food> _foodEntities = {
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

  final Map<String, int> _cartItems = {
    // key - item id,
    // value - quantity
  };

  List<Food> get foodItems {
    return _foodEntities.entries.map((entry) => entry.value).toList();
  }

  Food? get popularFood {
    if (_foodItemExists(_popularFood)) {
      return _foodEntities[_popularFood];
    }
    return null;
  }

  List<Food> get cartItems {
    return _cartItems.entries.fold(
      [],
      (previousFoodItems, entry) {
        List<Food> newFoodItems = [...previousFoodItems];
        if (_foodItemExists(entry.key)) {
          newFoodItems.add(_foodEntities[entry.key]!);
        }
        return newFoodItems;
      },
    );
  }

  _foodItemExists(String itemId) {
    return _foodEntities.containsKey(itemId);
  }

  /// get added quantity
  int getAddedQuantity(String itemId) {
    return _cartItems[itemId] ?? 0;
  }

  /// sets item quantity
  setItemQuantity(String itemId, int quantity) {
    _cartItems[itemId] = quantity;
    notifyListeners();
  }

  /// remove item from cart
  removeItem(String itemId) {
    _cartItems.remove(itemId);
    notifyListeners();
  }
}
