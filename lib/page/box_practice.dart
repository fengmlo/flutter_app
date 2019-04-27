import 'package:flutter/material.dart';

class BoxPractice extends StatelessWidget {
  static const String routeName = "box_practice";

  @override
  Widget build(BuildContext context) {
    var redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                maxHeight: 60,
                // 会忽略子view的大小设置
                minHeight: 50,
              ),
              child: Container(
                height: 80,
                width: 80,
                child: redBox,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
//                minHeight: double.infinity, // 加这行会报错，不知道原因
              ),
              child: Container(
                height: 80,
                width: 80,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
              //父
              child: UnconstrainedBox(
                //“去除”父级限制
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: redBox,
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(image: AssetImage("images/avatar.png")),
//                border: Border(
//                  top: BorderSide(color: Colors.red, width: 2),
//                  bottom: BorderSide(color: Colors.yellow, width: 10),
//                  left: BorderSide(color: Colors.red, width: 2),
//                  right: BorderSide(color: Colors.yellow, width: 10),
//                ),
                // 会导致上面的boder无效
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 1),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 4,
                  ),
                ],
                gradient: LinearGradient(colors: [Colors.yellow, Colors.green]),
                shape: BoxShape.rectangle,
//                backgroundBlendMode: BlendMode.dstOut
              ),
              child: SizedBox(
                width: 300,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
