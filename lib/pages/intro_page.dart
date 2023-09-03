import 'package:flutter/material.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/constants.dart';

import '../theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'SUSHI MAN',
                        style: TextStyle(
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
                      const Text(
                        'THE TASTE OF JAPANESE FOOD',
                        style: TextStyle(
                          fontSize: 44,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Feel the taste of the most popular Japanese food from anywhere and anytime.',
                        style: TextStyle(
                          height: 2,
                          letterSpacing: 1,
                          color: Colors.grey[300],
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
        },
      ),
    );
  }
}
