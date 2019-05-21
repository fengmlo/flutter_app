import 'package:flutter/material.dart';

import 'pages.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: MainPage(),
      routes: _buildRoutes(),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return new Map<String, WidgetBuilder>.fromIterable(allAppPages,
        key: (dynamic page) => "${page.routeName}",
        value: (dynamic page) => page.buildRoute);
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: _buildItems(),
      ),
    );
  }

  _buildItems() {
    return allAppPages
        .map((page) => ListTile(
            title: Text(page.title),
            onTap: () {
              Navigator.pushNamed(context, page.routeName);
            }))
        .toList();
  }
}
