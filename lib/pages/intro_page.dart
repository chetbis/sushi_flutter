import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/constants.dart';

import '../theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SUSHI MAN',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset('lib/images/fish_eggs.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'THE TASTE OF JAPANESE FOOD',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 44,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Feel the taste of the most popular Japanese food from anywhere and anytime.',
                  style: GoogleFonts.dmSerifDisplay(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 20,
                  text: 'Get Started',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.menuPage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
