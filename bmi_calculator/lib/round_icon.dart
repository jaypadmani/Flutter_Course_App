import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onpress;

  RoundIconButton({required this.iconData, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      shape: const CircleBorder(),
      child: Icon(iconData),
      elevation: 0.0,
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
