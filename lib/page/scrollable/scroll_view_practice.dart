import 'package:flutter/material.dart';

class ScrollViewPractice extends StatelessWidget {
  static const String routeName = "scroll_view_practice";

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            primary: true,
            // 安卓风格
            physics: ClampingScrollPhysics(),
//            physics: BouncingScrollPhysics(), // iOS风格
            child: Center(
              child: Row(
                children: str
                    .split("")
                    .map((c) => Text(
                          c,
                          textScaleFactor: 2.0,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
