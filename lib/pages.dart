import 'package:flutter/material.dart';
import 'package:flutter_app/page/random_words.dart';
import 'package:flutter_app/page/top_lake.dart';

List<AppPage> _buildAppPages() {
  final List<AppPage> appPages = <AppPage>[
    AppPage(title: "Top Lakes",
        routeName: TopLake.routeName,
        buildRoute: (BuildContext context) => TopLake()
    ),
    AppPage(
      title: "Random Words",
      routeName: RandomWords.routeName,
      buildRoute: (BuildContext context) => RandomWords()
    )
  ];
  return appPages;
}

final List<AppPage> allAppPages = _buildAppPages();

class AppPage {
  const AppPage({
    @required this.title,
    @required this.routeName,
    @required this.buildRoute,
  })
      :assert(title != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final String routeName;
  final WidgetBuilder buildRoute;

}