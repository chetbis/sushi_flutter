import 'package:flutter/material.dart';

class PopularFood extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String price;
  final UniqueKey tag;
  final void Function()? onTap;

  const PopularFood({
    super.key,
    required this.imagePath,
    required this.foodName,
    required this.price,
    required this.tag,
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
              tag: tag,
              child: Image.asset(imagePath, height: 100),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
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
