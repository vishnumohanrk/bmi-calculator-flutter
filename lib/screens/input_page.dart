import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_btn.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/top_row_card.dart';
import 'package:bmi_calculator/components/height_comp.dart';
import 'package:bmi_calculator/components/counter_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum _gender = GenderEnum.male;
  int _height = 150;
  int _age = 20;
  int _weight = 74;

  void _updateState(StateEnum stateLabel, dynamic payload) {
    switch (stateLabel) {
      case StateEnum.gender:
        setState(() {
          _gender = payload;
        });
        break;
      case StateEnum.height:
        setState(() {
          _height = payload;
        });
        break;
      case StateEnum.weight:
        setState(() {
          int dec = _weight - 1 <= 1 ? 1 : _weight - 1;
          int inc = _weight + 1 >= 200 ? 200 : _weight + 1;
          _weight = payload == CounterEnum.increment ? inc : dec;
        });
        break;
      case StateEnum.age:
        setState(() {
          int dec = _age - 1 <= 1 ? 1 : _age - 1;
          int inc = _age + 1 >= 110 ? 110 : _age + 1;
          _age = payload == CounterEnum.increment ? inc : dec;
        });
        break;
    }
  }

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
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: _gender == GenderEnum.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: TopRowCard(gender: GenderEnum.male),
                      onPress: () =>
                          _updateState(StateEnum.gender, GenderEnum.male),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: _gender == GenderEnum.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: TopRowCard(gender: GenderEnum.female),
                      onPress: () =>
                          _updateState(StateEnum.gender, GenderEnum.female),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                child: HeightComp(
                  value: _height,
                  onChange: (val) => _updateState(StateEnum.height, val),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: CounterCard(
                        label: 'WEIGHT',
                        value: _weight,
                        dec: () => _updateState(
                            StateEnum.weight, CounterEnum.decrement),
                        inc: () => _updateState(
                            StateEnum.weight, CounterEnum.increment),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: CounterCard(
                        label: 'AGE',
                        value: _age,
                        dec: () =>
                            _updateState(StateEnum.age, CounterEnum.decrement),
                        inc: () =>
                            _updateState(StateEnum.age, CounterEnum.increment),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomBtn(
              onPress: () {
                BMICalculator obj = BMICalculator(
                  weight: _weight,
                  height: _height,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      value: obj.getValue(),
                      oneLineResult: obj.getOneLineResult(),
                      detailedResult: obj.getDetailedResult(),
                    ),
                  ),
                );
              },
              label: 'CALCULATE YOUR BMI',
            ),
          ],
        ),
      ),
    );
  }
}
