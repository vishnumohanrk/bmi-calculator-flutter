import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function onPress;
  final Widget child;
  final Color color;

  ReusableCard({
    this.onPress,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 4.0,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
