import 'package:flutter/material.dart';
import 'package:flutter_app/page/animation/hero_animation_practice.dart';
import 'package:flutter_app/page/list_practice.dart';

import 'route_animation_practice.dart';
import 'scale_animation_practice.dart';
import 'stagger_animation_practice.dart';

class AnimationPractice extends StatelessWidget {
  static const routeName = "animation_practice";

  @override
  Widget build(BuildContext context) {
    return PracticeListView(<SimplePage>[
      SimplePage(
          title: "ScaleAnimationPractice", route: ScaleAnimationPractice()),
      SimplePage(
          title: "RouteAnimationPractice", route: RouteAnimationPractice()),
      SimplePage(title: "HeroAnimationRouteA", route: HeroAnimationRouteA()),
      SimplePage(title: "StaggerDemo", route: StaggerDemo()),
    ]);
  }
}
