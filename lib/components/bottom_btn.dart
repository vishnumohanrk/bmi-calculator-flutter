import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class BottomBtn extends StatelessWidget {
  final Function onPress;
  final String label;

  BottomBtn({
    this.onPress,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0),
      width: double.infinity,
      height: 80.0,
      child: FlatButton(
        color: kPinkColor,
        onPressed: onPress,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
