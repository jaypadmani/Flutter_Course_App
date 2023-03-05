import 'package:flutter/material.dart';
import 'constant.dart';


class bottom_button extends StatelessWidget {

  final Function() ontap;
  final String  text;



  bottom_button({required this.ontap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child:  Center(
          child:  Text(
            text.toString(),
            style: kButtonTextStyle,
          ),
        ),
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}