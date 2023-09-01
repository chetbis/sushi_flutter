import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/models/food.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food foodItem;

  const FoodDetailsPage({
    super.key,
    required this.foodItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  Hero(
                    tag: foodItem.imagePath,
                    child: Image.asset(
                      foodItem.imagePath,
                      height: 250,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        foodItem.rating,
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.grey[700],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    foodItem.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Description',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla pretium elit et vehicula. Sed consequat mauris nunc, sit amet blandit dui vestibulum malesuada. Vivamus finibus ipsum quis nulla pulvinar sagittis. Aenean fermentum, sapien non posuere varius, augue tortor dictum libero, at dapibus nunc metus non nulla. Nullam egestas tellus vitae lacus venenatis tempor non in sapien. Donec sit amet condimentum ipsum. Cras sodales risus urna, id dignissim tortor ultricies a. Vestibulum porttitor tincidunt sapien, non facilisis erat tincidunt eget. In accumsan tellus a mattis tincidunt. Phasellus rutrum a diam eu ullamcorper. Etiam laoreet a dui quis sodales. Donec quis urna vehicula, tincidunt nulla et, suscipit lectus.Nulla tempor ante nec elit ultricies mattis. Ut faucibus consequat erat, sed consectetur mauris ultricies ac. Nullam a lectus varius, aliquam dui sit amet, ultrices ex. Vivamus eu feugiat ligula, laoreet consequat leo. Sed consectetur vulputate vulputate. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam nulla purus, commodo in diam nec, iaculis consequat orci. Duis justo turpis, pretium in arcu vel, sodales porta massa. Cras eget neque sed nisi volutpat mollis sit amet vitae ex. Fusce mollis ipsum at erat vulputate dictum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce in nisl lacus. Integer ultricies, neque quis placerat volutpat, felis lectus pharetra erat, quis ullamcorper mauris lectus sed orci. Fusce porta mauris vel dolor facilisis bibendum vitae at ipsum.',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
