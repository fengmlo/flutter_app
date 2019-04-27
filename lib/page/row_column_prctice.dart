import 'package:flutter/material.dart';

class RowColumnPractice extends StatelessWidget {
  static const String routeName = "row_column_prctice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            // Flex的子类包在Flex子类中的时候，被包含的子类最大尺寸会失效
            Expanded(
              // 弹性系数，类似Android的weight
              flex: 1,
              child: Column(
                // 下面这句会失效
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    // 指定水平方向的对齐方式
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Hello World"),
                    ],
                  ),
                  Row(
                    // 指定文本的排列方式
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text("Hello World"),
                      Text("I'm Fcc"),
                    ],
                  ),
                  Row(
                    // 指定垂直方向的排列方向，up为从下往上
                    verticalDirection: VerticalDirection.up,
                    // 指定垂直方向的对齐方式
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Hello World",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                        ),
                      ),
                      Text("I'm Fcc"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: <Widget>[Text("Hello World!"), Text("I'm Fcc")],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
