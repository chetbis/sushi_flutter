import 'package:flutter/material.dart';
import 'package:sushi/theme/colors.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CircularIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Container(
          decoration: const BoxDecoration(
            color: secondaryColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              onPressed?.call();
            },
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
