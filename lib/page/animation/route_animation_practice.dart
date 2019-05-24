import 'package:flutter/material.dart';

import 'scale_animation_practice.dart';

class RouteAnimationPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.yellow,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleAnimationPractice(),
                        );
                      }));
            },
            child: Text("Button"),
          ),
        ],
      ),
    );
  }
}
