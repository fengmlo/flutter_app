import 'package:flutter/material.dart';

class ContainerPractice extends StatelessWidget {
  static const String routeName = "container_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            alignment: Alignment.center,
            // padding 和 margin 同Android
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 16),
            // color 和 decoration 互斥
//            color: Colors.green,
            // ShapeDecoration 和 BoxDecoration相似点很多，ShapeDecoration有一些特殊的边框
            decoration: ShapeDecoration(
              color: Colors.green,
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.red,
                  width: 10,
                ),
//                borderRadius: BorderRadius.circular(20),
              ),
            ),
            foregroundDecoration: FlutterLogoDecoration(),
            child: Text("Hello World!"),
            transform: Matrix4.rotationZ(0.1),
          ),
        ),
      ),
    );
  }
}
