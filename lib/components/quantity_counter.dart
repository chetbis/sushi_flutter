import 'package:flutter/material.dart';
import 'circular_icon_btn.dart';

class QuantityCounter extends StatefulWidget {
  int itemQuantity;
  final void Function(int)? onValueChanged;

  QuantityCounter({
    super.key,
    this.itemQuantity = 0,
    this.onValueChanged,
  });

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularIconButton(
          icon: Icons.remove,
          onPressed: () {
            if (widget.itemQuantity == 0) return;
            setState(() => widget.itemQuantity--);
            widget.onValueChanged?.call(widget.itemQuantity);
          },
        ),
        SizedBox(
          width: 40,
          child: Center(
            child: Text(
              '${widget.itemQuantity}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        CircularIconButton(
          icon: Icons.add,
          onPressed: () {
            setState(() => widget.itemQuantity++);
            widget.onValueChanged?.call(widget.itemQuantity);
          },
        ),
      ],
    );
  }
}
