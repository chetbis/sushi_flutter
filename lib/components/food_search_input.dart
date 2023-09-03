import 'package:flutter/material.dart';

class FoodSearchInput extends StatelessWidget {
  const FoodSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: 'Search here...',
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
