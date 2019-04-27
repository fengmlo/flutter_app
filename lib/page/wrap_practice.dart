import 'package:flutter/material.dart';

class WrapPractice extends StatelessWidget {
  static const String routeName = "wrap_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text("Hello World!" * 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: <Widget>[
                  Text("Hello World!"),
                  Text("Hello World!"),
                  Text("Hello World!"),
                  Text("Hello World!"),
                  Text("Hello World!"),
                  Text("Hello World!"),
                  Text("Hello World!"),
                ],
              ),
            ),
            Wrap(
              spacing: 20,
              runAlignment: WrapAlignment.end,
              alignment: WrapAlignment.end,
              runSpacing: 20,
              children: <Widget>[
                Text("Hello World!"),
                Text("Hello World!"),
                Text("Hello World!"),
                Text("Hello World!"),
                Text("Hello World!"),
                Text("Hello World!"),
                Text("Hello World!"),
              ],
            ),
            Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('A')),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: new Text('Lafayette'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: new Text('Mulligan'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('Laurens'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
