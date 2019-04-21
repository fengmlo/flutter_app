import 'package:flutter/material.dart';

class TextPractice extends StatelessWidget {
  static const String routeName = "text_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 16, color: Colors.green[300]),
        child: Column(
          children: <Widget>[
            Text("Hello world!", textAlign: TextAlign.center),
            Text(
              "0123456789" * 10,
              overflow: TextOverflow.visible, // 没看出来效果
              maxLines: 1,
              textScaleFactor: 1.5,
            ),
            Text(
              "0123456789" * 10,
              overflow: TextOverflow.clip, // 没看出来效果
              maxLines: 1,
              textScaleFactor: 1.5,
            ),
            Text(
              "0123456789" * 10,
              overflow: TextOverflow.fade, // 字的下面有渐隐效果
              maxLines: 1,
              textScaleFactor: 1.5,
            ),
            Text(
              "0123456789" * 10,
              overflow: TextOverflow.ellipsis, // 最后会有省略号
              maxLines: 1,
              textScaleFactor: 1.5,
            ),
            Text(
              "0123456789" * 10,
              softWrap: true,
            ),
            Text(
              "Hello world!",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello world!" * 10,
              style: TextStyle(
                fontSize: 36,
                // 指定多少倍行高，行的高度取决于 height * fontSize
                height: 1.5,
                color: Colors.amber,
//              backgroundColor: Colors.amberAccent, // 是下面这种方式的一种快捷写法，不能共存
                background: Paint()..color = Colors.red,
//              decoration: TextDecoration.lineThrough,
                decoration: TextDecoration.combine(<TextDecoration>[
                  // 组合多个，似乎没法单独指定style
                  TextDecoration.overline,
                  TextDecoration.lineThrough,
                  TextDecoration.underline,
                ]),
//              decorationStyle: TextDecorationStyle.dashed, // 虚线
//              decorationStyle: TextDecorationStyle.dotted, // 点
//              decorationStyle: TextDecorationStyle.double, // 双线
                decorationStyle: TextDecorationStyle.wavy, // 波浪线
//              decorationStyle: TextDecorationStyle.solid, // 实线/没效果
              ),
            ),
            Text.rich(TextSpan(text: "Hello", children: [
              TextSpan(
                  text: "World!",
                  style: TextStyle(
                      color: Colors.blue, backgroundColor: Colors.blue[100])),
              TextSpan(
                text: "fcc",
              )
            ]))
          ],
        ),
      ),
    );
  }
}
