import 'package:flutter/material.dart';

class WillPopScopePractice extends StatefulWidget {
  static const routeName = "will_pop_scope_practice";

  @override
  _WillPopScopePracticeState createState() => _WillPopScopePracticeState();
}

class _WillPopScopePracticeState extends State<WillPopScopePractice> {
  DateTime _lastPressedTime; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          if (_lastPressedTime == null ||
              DateTime.now().difference(_lastPressedTime) >
                  Duration(seconds: 1)) {
            // 两次点击间隔超过1秒则重新计时
            _lastPressedTime = DateTime.now();
            return false;
          }
          return true;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}
