import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularFood extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String price;
  final void Function()? onTap;

  const PopularFood({
    super.key,
    required this.imagePath,
    required this.foodName,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Hero(
              tag: imagePath,
              child: Image.asset(imagePath, height: 100),
            ),
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
                  '\$$price',
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
      ),
    );
  }
}
