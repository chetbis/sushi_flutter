import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularFood extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String price;

  const PopularFood({
    super.key,
    required this.imagePath,
    required this.foodName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, height: 100),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                price,
                style: GoogleFonts.dmSerifDisplay(color: Colors.grey[700]),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.favorite_outline,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }
}
