import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterCard extends StatelessWidget {
  final String label;

  CounterCard({
    this.label,
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
          '74',
          style: kNumberTextStyle,
        ),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CounterBtn(CounterEnum.decrement),
            CounterBtn(CounterEnum.increment),
          ],
        ),
      ],
    );
  }
}

class CounterBtn extends StatelessWidget {
  final CounterEnum parameter;

  CounterBtn(this.parameter);

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
      onPressed: () {},
    );
  }
}
