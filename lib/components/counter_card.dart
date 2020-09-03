import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final Function dec;
  final Function inc;

  CounterCard({
    this.label,
    this.value,
    this.inc,
    this.dec,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        SizedBox(height: 4.0),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CounterBtn(
              parameter: CounterEnum.decrement,
              onPress: dec,
            ),
            CounterBtn(
              parameter: CounterEnum.increment,
              onPress: inc,
            ),
          ],
        ),
      ],
    );
  }
}

class CounterBtn extends StatelessWidget {
  final CounterEnum parameter;
  final Function onPress;

  CounterBtn({this.parameter, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xff4B4C5C),
      child: FaIcon(
        parameter == CounterEnum.increment
            ? FontAwesomeIcons.plus
            : FontAwesomeIcons.minus,
        size: 19.0,
      ),
      onPressed: onPress,
    );
  }
}
