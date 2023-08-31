import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/colors.dart';
import 'button.dart';

class ActionableCard extends StatelessWidget {
  final String title;
  final String actionBtnText;
  final String assetImagePath;

  const ActionableCard({
    super.key,
    required this.title,
    required this.actionBtnText,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                text: actionBtnText,
                onTap: () {},
              ),
            ],
          ),
          Image.asset(
            assetImagePath,
            height: 100,
          )
        ],
      ),
    );
  }
}
