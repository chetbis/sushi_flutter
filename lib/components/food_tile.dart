import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String rating;
  final UniqueKey tag;
  final void Function()? onTapped;

  const FoodTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    required this.tag,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapped?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: tag,
              child: Image.asset(imagePath, height: 140),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$$price',
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        rating,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
