import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformPractice extends StatelessWidget {
  static const String routeName = "transform_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Column在水平方向的大小为其最大子View的大小，所以加个Center扩展子View大小，让他们能居中
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 80),
              color: Colors.green,
              child: Transform(
                transform: Matrix4.skewY(0.3),
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.deepOrange,
                  child: Text("Apartment for rent!"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.translate(
                offset: Offset(-20, -5),
                child: Text("Hello World!"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: Text("Hello World!"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: Text("Hello World!"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text("Hello World!"),
                  ),
                ),
                Text("你好"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
