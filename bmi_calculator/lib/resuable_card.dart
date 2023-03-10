import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  Widget? childWidget;
  final Function()? onPress;

  ReusableCard({required this.color,  this.childWidget, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: childWidget,
      ),
    );
  }
}