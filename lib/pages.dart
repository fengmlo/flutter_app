import 'package:flutter/material.dart';
import 'package:flutter_app/page/button_practice.dart';
import 'package:flutter_app/page/random_words.dart';
import 'package:flutter_app/page/text_practice.dart';
import 'package:flutter_app/page/top_lake.dart';

import 'page/image_practice.dart';
import 'page/switch_checkbox_practice.dart';
import 'page/text_field_practice.dart';

List<AppPage> _buildAppPages() {
  final List<AppPage> appPages = <AppPage>[
    AppPage(
      title: "Top Lakes",
      routeName: TopLake.routeName,
      buildRoute: (BuildContext context) => TopLake(),
    ),
    AppPage(
      title: "Random Words",
      routeName: RandomWords.routeName,
      buildRoute: (BuildContext context) => RandomWords(),
    ),
    AppPage(
      title: "Text",
      routeName: TextPractice.routeName,
      buildRoute: (BuildContext context) => TextPractice(),
    ),
    AppPage(
      title: "Button",
      routeName: ButtonPractice.routeName,
      buildRoute: (BuildContext context) => ButtonPractice(),
    ),
    AppPage(
      title: "Image",
      routeName: ImagePractice.routeName,
      buildRoute: (BuildContext context) => ImagePractice(),
    ),
    AppPage(
      title: "SwitchAndCheckbox",
      routeName: SwitchAndCheckBoxPractice.routeName,
      buildRoute: (BuildContext context) => SwitchAndCheckBoxPractice(),
    ),
    AppPage(
      title: "TextField",
      routeName: TextFieldPractice.routeName,
      buildRoute: (BuildContext context) => TextFieldPractice(),
    ),
  ];
  return appPages;
}

final List<AppPage> allAppPages = _buildAppPages();

class AppPage {
  const AppPage({
    @required this.title,
    @required this.routeName,
    @required this.buildRoute,
  })  : assert(title != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final String routeName;
  final WidgetBuilder buildRoute;
}
