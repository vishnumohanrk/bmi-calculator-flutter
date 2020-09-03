import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class HeightComp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'HEIGHT',
            style: kLabelTextStyle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              Text(
                '180',
                style: kNumberTextStyle,
              ),
              Text(
                ' CM',
                style: kLabelTextStyle,
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: kGreyColor,
              overlayColor: Color(0x29EB1555),
              thumbColor: kPinkColor,
            ),
            child: Slider(
              max: 220.0,
              min: 120.0,
              value: 152.0,
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
