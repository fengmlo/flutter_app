import 'package:flutter/material.dart';

class ImagePractice extends StatelessWidget {
  static const String routeName = "image_practice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Image(image: AssetImage("images/avatar.png")),
            Image.asset(
              "images/avatar.png",
              width: 100,
              height: 100,
              scale: 0.5,
            ),
            Image.asset(
              "images/avatar.png",
              // 只指定一个，另一个会等比缩放
              width: 100,
              scale: 1.5,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              fit: BoxFit.contain, // 默认方式，将图片等比缩放到容器刚好能装下，不会变形，可能不会覆盖满整个容器
//              fit: BoxFit.fill, // 将图片拉扯到容器刚好能装下，会变形
//              fit: BoxFit.cover, // 将图片等比缩放到短的那边刚好能装下，不会变形，会覆盖满整个容器
//              fit: BoxFit.fitWidth, // 将图片等比缩放到宽度刚好能装下，不会变形，可能不会覆盖满整个容器
//              fit: BoxFit.fitHeight, // 将图片等比缩放到高度刚好能装下，不会变形，可能不会覆盖满整个容器
//              fit: BoxFit.scaleDown, // 如果图片比容器对应边大，将图片等比缩放到容器刚好能装下，否则什么也不做
              fit: BoxFit.none, // 不缩放
            )
          ],
        ),
      ),
    );
  }
}
