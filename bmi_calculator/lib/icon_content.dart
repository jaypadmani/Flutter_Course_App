import 'package:flutter/material.dart';
import 'constant.dart';

class iconContainer extends StatelessWidget {
  final IconData? icon;
  final String? label;



  iconContainer({ this.icon,  this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label.toString(),
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
