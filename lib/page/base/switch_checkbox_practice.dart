import 'package:flutter/material.dart';

class SwitchAndCheckBoxPractice extends StatefulWidget {
  static const String routeName = "switch_checkBox_practice";

  @override
  _SwitchAndCheckBoxPracticeState createState() =>
      _SwitchAndCheckBoxPracticeState();
}

class _SwitchAndCheckBoxPracticeState extends State<SwitchAndCheckBoxPractice> {
  bool _switchSelected = false;
  bool _checkBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkBoxSelected,
              onChanged: (value) {
                setState(() {
                  _checkBoxSelected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
