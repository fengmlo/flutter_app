import 'package:flutter/material.dart';

class ButtonPractice extends StatelessWidget {
  static const String routeName = "button_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
//              textColor: Colors.blue, // 字体颜色
              // 背景色
              color: Colors.blue[200],
              // 水波纹颜色
              splashColor: Colors.red[300],
              // 刚点击时高亮颜色
              colorBrightness: Brightness.dark,
              // Button上升到最高时的颜色
              highlightColor: Colors.yellow,
              elevation: 2,
              highlightElevation: 10,
              child: Text(
                "Raised Button",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
              onPressed: () {},
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.blue[200],
              splashColor: Colors.red[300],
              colorBrightness: Brightness.dark,
              highlightColor: Colors.yellow,
              padding: EdgeInsets.all(0),
              shape: Border.all(),
              child: Text("Flat Button"),
            ),
            OutlineButton(
              onPressed: () {},
              borderSide: BorderSide(color: Colors.blue),
              child: Text("Outline Button"),
            ),
            IconButton(
              iconSize: 16,
              icon: Icon(Icons.access_alarm),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
