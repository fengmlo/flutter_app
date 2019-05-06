import 'package:flutter/material.dart';

class ScrollControllerPractice extends StatefulWidget {
  static const routeName = "scroll_controller_practice";

  @override
  _ScrollControllerPracticeState createState() =>
      _ScrollControllerPracticeState();
}

class _ScrollControllerPracticeState extends State<ScrollControllerPractice> {
  ScrollController _controller = ScrollController();
  bool showButton = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showButton) {
        setState(() {
          showButton = false;
        });
      } else if (_controller.offset >= 1000 && !showButton) {
        setState(() {
          showButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: Scrollbar(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
                setState(() {
                  _progress = "${(progress * 100).toInt()}%";
                });
                print("BottomEdge: ${notification.metrics.extentAfter == 0}");
                //return true; //放开此行注释后，进度条将失效
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ListView.builder(
                    // key 用来保存滚动位置（当页面可能会dispose的时候，比如用在TabBarView中），
                    // 页面中有多个滚动控件时需要指定多个value不同的PageStorageKey
                    key: PageStorageKey(1),
                    itemCount: 100,
                    itemExtent: 50,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("$index"),
                      );
                    },
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Text(_progress),
                    backgroundColor: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: !showButton
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                // 返回到顶部时执行动画
                _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
    );
  }
}
