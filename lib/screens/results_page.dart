import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_btn.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String oneLineResult;
  final String detailedResult;
  final String value;

  ResultsPage({
    this.value,
    this.detailedResult,
    this.oneLineResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        oneLineResult,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          fontSize: 28.0,
                        ),
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 85.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          detailedResult,
                          textAlign: TextAlign.center,
                          style: kLabelTextStyle.copyWith(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomBtn(
              label: 'RECALCULATE',
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
