import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';

class TopRowCard extends StatelessWidget {
  final GenderEnum gender;

  TopRowCard({
    this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FaIcon(
          gender == GenderEnum.female
              ? FontAwesomeIcons.venus
              : FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(height: 10.0),
        Text(
          gender == GenderEnum.female ? 'FEMALE' : 'MALE',
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
