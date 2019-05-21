import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GesturePractice extends StatelessWidget {
  static const routeName = "gesture_practice";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("GestureDetectorPractice"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return GestureDetectorPractice();
                      },
                    ),
                  ),
            ),
            ListTile(
              title: Text("DragPractice"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return DragPractice();
                      },
                    ),
                  ),
            ),
            ListTile(
              title: Text("ScalePractice"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ScalePractice();
                      },
                    ),
                  ),
            ),
            ListTile(
              title: Text("GestureRecognizerPractice"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return GestureRecognizerPractice();
                      },
                    ),
                  ),
            ),
            ListTile(
              title: Text("GestureArenaPractice"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return GestureArenaPractice();
                      },
                    ),
                  ),
            ),
            ListTile(
              title: Text("GestureConflictPractice"),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return GestureConflictPractice();
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureDetectorPractice extends StatefulWidget {
  static const routeName = "guesture_detector_practice";

  @override
  _GestureDetectorPracticeState createState() =>
      _GestureDetectorPracticeState();
}

class _GestureDetectorPracticeState extends State<GestureDetectorPractice> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200.0,
                  height: 100.0,
                  child: Text(
                    _operation,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => updateText("Tap"), //点击
                onDoubleTap: () => updateText("DoubleTap"), //双击
                onLongPress: () => updateText("LongPress"), //长按
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class DragPractice extends StatefulWidget {
  static const routeName = "drag_practice";

  @override
  _DragPracticeState createState() => _DragPracticeState();
}

class _DragPracticeState extends State<DragPractice> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                onPanDown: (DragDownDetails details) {
                  //打印手指按下的位置(相对于屏幕)
                  print("用户手指按下：${details.globalPosition}");
                },
                //手指滑动时会触发此回调
                onPanUpdate: (DragUpdateDetails details) {
                  //用户手指滑动时，更新偏移，重新构建
                  setState(() {
                    _left += details.delta.dx;
                    _top += details.delta.dy;
                  });
                },
                onPanEnd: (DragEndDetails details) {
                  //打印滑动结束时在x、y轴上的速度
                  print(details.velocity);
                },
                //垂直方向拖动事件
//                onVerticalDragUpdate: (DragUpdateDetails details) {
//                  //用户手指滑动时，更新偏移，重新构建
//                  setState(() {
////                    _left += details.delta.dx;
//                    _top += details.delta.dy;
//                  });
//                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScalePractice extends StatefulWidget {
  @override
  _ScalePracticeState createState() => _ScalePracticeState();
}

class _ScalePracticeState extends State<ScalePractice> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: GestureDetector(
            //指定宽度，高度自适应
            child: Image.asset("images/lake.jpg", width: _width),
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                //缩放倍数在0.8到10倍之间
                _width = 200 * details.scale.clamp(.8, 10.0);
              });
            },
          ),
        ),
      ),
    );
  }
}

class GestureRecognizerPractice extends StatefulWidget {
  @override
  _GestureRecognizerPracticeState createState() =>
      _GestureRecognizerPracticeState();
}

class _GestureRecognizerPracticeState extends State<GestureRecognizerPractice> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: _toggle ? Colors.blue : Colors.red,
                  ),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                ),
                TextSpan(text: "你好世界"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GestureArenaPractice extends StatefulWidget {
  @override
  _GestureArenaPracticeState createState() => _GestureArenaPracticeState();
}

class _GestureArenaPracticeState extends State<GestureArenaPractice> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(child: Text("A")),
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureConflictPractice extends StatefulWidget {
  @override
  _GestureConflictPracticeState createState() =>
      _GestureConflictPracticeState();
}

class _GestureConflictPracticeState extends State<GestureConflictPractice> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: _left,
              child: Listener(
                onPointerDown: (details) {
                  print("down");
                },
                onPointerUp: (details) {
                  //会触发
                  print("up");
                },
                child: GestureDetector(
                  child: CircleAvatar(child: Text("A")),
                  //要拖动和点击的widget
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _left += details.delta.dx;
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    print("onHorizontalDragEnd");
                  },
                  onTapDown: (details) {
                    print("down");
                  },
                  onTapUp: (details) {
                    print("up");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
