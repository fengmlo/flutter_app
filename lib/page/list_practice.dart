import 'package:flutter/material.dart';

class PracticeListView extends StatelessWidget {
  final List<SimplePage> pageList;

  PracticeListView(this.pageList);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(child: ListView(children: _buildItem(context))),
    );
  }

  List<Widget> _buildItem(BuildContext context) {
    return pageList.map((page) {
      return ListTile(
        title: Text(page.title),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return page.route;
          }));
        },
      );
    }).toList();
  }
}

class SimplePage {
  const SimplePage({@required this.title, @required this.route})
      : assert(title != null),
        assert(route != null);

  final String title;
  final Widget route;
}
