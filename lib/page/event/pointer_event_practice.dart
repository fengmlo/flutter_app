import 'package:flutter/material.dart';

class PointerEventPractice extends StatefulWidget {
  static const routeName = "pointer_event_practice";

  @override
  _PointerEventPracticeState createState() => _PointerEventPracticeState();
}

class _PointerEventPracticeState extends State<PointerEventPractice> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Listener(
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 300,
                  height: 150,
                  child: Text(
                    _event?.toString() ?? "",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
//                behavior: HitTestBehavior.opaque, // 放开后外部空白区域可点击
              onPointerDown: (event) => print("down A"),
            ),
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                  ),
                  onPointerDown: (event) => print("down1"),
//                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                )
              ],
            ),
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200.0,
                    height: 100.0,
                  ),
                  onPointerDown: (event)=>print("in"),
                ),
              ),
              onPointerDown: (event)=>print("up"),
            ),
          ],
        ),
      ),
    );
  }
}
