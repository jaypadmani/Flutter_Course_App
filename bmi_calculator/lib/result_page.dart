import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  final String BMI;
  final String getResult;
  final String interpretation;

  ResultPage({required this.BMI, required this.getResult, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,

              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    getResult.toUpperCase(),

                    style: kResultTextStyle,
                  ),
                   Text(
                    BMI,

                    style: kCalulationTextStyle,
                  ),
                   Text(
                    interpretation,
                    style: kSuggestionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          bottom_button(
            text: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}
