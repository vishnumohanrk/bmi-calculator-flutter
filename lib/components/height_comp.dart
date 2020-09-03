import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class HeightComp extends StatelessWidget {
  final int value;
  final Function onChange;

  HeightComp({
    this.value,
    this.onChange,
  });

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
                value.toString(),
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
              overlayColor: Color(0x59EB1555),
              thumbColor: kPinkColor,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 14.0,
              ),
            ),
            child: Slider(
              max: 220.0,
              min: 120.0,
              value: value.toDouble(),
              onChanged: (value) => onChange(value.toInt()),
            ),
          )
        ],
      ),
    );
  }
}
