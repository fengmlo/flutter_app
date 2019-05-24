import 'package:flutter/material.dart';

class ScaleAnimationPractice extends StatefulWidget {
  @override
  _ScaleAnimationPracticeState createState() => _ScaleAnimationPracticeState();
}

class _ScaleAnimationPracticeState extends State<ScaleAnimationPractice>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    //图片宽高从0变到300
    var curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation = Tween(begin: 0.0, end: 300.0).animate(curvedAnimation)
        /*..addListener(() {
        setState(() {});
      })*/
        ;
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var animate = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceInOut))
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });
    return Material(
//      child: Center(
//        child: Image.asset(
//          "images/avatar.png",
//          width: animation.value,
//          height: animation.value,
//        ),
//      ),
//    child: AnimatedImage(animation: animation),
//      child: AnimatedBuilder(
//        animation: animation,
//        child: Image.asset("images/avatar.png"),
//        builder: (BuildContext context, Widget child) {
//          return Center(
//            child: FadeTransition(
//              opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.bounceInOut)),
//              child: Container(
//                height: animation.value,
//                width: animation.value,
//                child: child,
//              ),
//            ),
//          );
//        },
//      ),
      child: Stack(
        children: <Widget>[
          FractionalTranslation(
            translation: Offset(animation.value, animate.value),
            child: FadeTransition(
              opacity: animate,
              child: ScaleTransition(
                scale: animate,
                child: Center(child: Image.asset("images/avatar.png")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({
    Key key,
    @required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
        "images/avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
