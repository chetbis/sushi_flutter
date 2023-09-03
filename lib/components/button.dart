import 'package:flutter/material.dart';
import 'package:sushi/theme/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double fontSize;

  const MyButton({
    super.key,
    required this.text,
    this.onTap,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
