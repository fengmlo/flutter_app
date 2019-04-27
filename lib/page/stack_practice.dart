import 'package:flutter/material.dart';

class StackPractice extends StatelessWidget {
  static const String routeName = "stack_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 默认大小为第一个view的大小
        child: SizedBox(
          width: 300,
          height: 500,
          child: Stack(
            // 子View大小超过时的裁切规则
            overflow: Overflow.visible,
//            fit: StackFit.expand, // 没有定位的view会铺满整个容器，同时容器也会尽量撑满父容器
            children: <Widget>[
              // 默认会占据最大的容器空间
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.yellow,
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
//              SizedBox(
//                width: 200,
//                height: 200,
//                child: Container(
//                  color: Colors.blue,
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
