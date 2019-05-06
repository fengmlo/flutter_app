import 'package:flutter/material.dart';
import 'package:flutter_app/page/base/button_practice.dart';
import 'package:flutter_app/page/random_words.dart';
import 'package:flutter_app/page/base/text_practice.dart';
import 'package:flutter_app/page/top_lake.dart';

import 'package:flutter_app/page/container/box_practice.dart';
import 'package:flutter_app/page/container/container_practice.dart';
import 'package:flutter_app/page/scrollable/custom_scroll_view_practice.dart';
import 'package:flutter_app/page/scrollable/grid_view_practice.dart';
import 'package:flutter_app/page/base/image_practice.dart';
import 'package:flutter_app/page/scrollable/infinite_list_view.dart';
import 'package:flutter_app/page/scrollable/list_view_practice.dart';
import 'package:flutter_app/page/container/row_column_prctice.dart';
import 'package:flutter_app/page/container/scaffold_practice.dart';
import 'package:flutter_app/page/scrollable/scroll_view_practice.dart';
import 'page/scrollable/scroll_controller_practice.dart';
import 'package:flutter_app/page/container/stack_practice.dart';
import 'package:flutter_app/page/base/switch_checkbox_practice.dart';
import 'package:flutter_app/page/base/text_field_practice.dart';
import 'page/transform_practice.dart';
import 'package:flutter_app/page/container/wrap_practice.dart';

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
    AppPage(
      title: "RowColumnPractice",
      routeName: RowColumnPractice.routeName,
      buildRoute: (BuildContext context) => RowColumnPractice(),
    ),
    AppPage(
      title: "WrapPractice",
      routeName: WrapPractice.routeName,
      buildRoute: (BuildContext context) => WrapPractice(),
    ),
    AppPage(
      title: "StackPractice",
      routeName: StackPractice.routeName,
      buildRoute: (BuildContext context) => StackPractice(),
    ),
    AppPage(
      title: "BoxPractice",
      routeName: BoxPractice.routeName,
      buildRoute: (BuildContext context) => BoxPractice(),
    ),
    AppPage(
      title: "TransformPractice",
      routeName: TransformPractice.routeName,
      buildRoute: (BuildContext context) => TransformPractice(),
    ),
    AppPage(
      title: "ContainerPractice",
      routeName: ContainerPractice.routeName,
      buildRoute: (BuildContext context) => ContainerPractice(),
    ),
    AppPage(
      title: "ScaffoldPractice",
      routeName: ScaffoldPractice.routeName,
      buildRoute: (BuildContext context) => ScaffoldPractice(),
    ),
    AppPage(
      title: "ScrollViewPractice",
      routeName: ScrollViewPractice.routeName,
      buildRoute: (BuildContext context) => ScrollViewPractice(),
    ),
    AppPage(
      title: "ListViewPractice",
      routeName: ListViewPractice.routeName,
      buildRoute: (BuildContext context) => ListViewPractice(),
    ),
    AppPage(
      title: "InfiniteListView",
      routeName: InfiniteListView.routeName,
      buildRoute: (BuildContext context) => InfiniteListView(),
    ),
    AppPage(
      title: "GridViewPractice",
      routeName: GridViewPractice.routeName,
      buildRoute: (BuildContext context) => GridViewPractice(),
    ),
    AppPage(
      title: "CustomScrollViewPractice",
      routeName: CustomScrollViewPractice.routeName,
      buildRoute: (BuildContext context) => CustomScrollViewPractice(),
    ),
    AppPage(
      title: "ScrollControllerPractice",
      routeName: ScrollControllerPractice.routeName,
      buildRoute: (BuildContext context) => ScrollControllerPractice(),
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
