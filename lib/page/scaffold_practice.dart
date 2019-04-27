import 'package:flutter/material.dart';

class ScaffoldPractice extends StatefulWidget {
  static const String routeName = "scaffold_practice";

  @override
  _ScaffoldPracticeState createState() => _ScaffoldPracticeState();
}

class _ScaffoldPracticeState extends State<ScaffoldPractice>
    with SingleTickerProviderStateMixin {
  var _currentIndex = 1;
  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用GlobalKey和使用build都能实现这个功能
      key: _globalKey,
      appBar: AppBar(
        title: Text("ScaffoldPractice"),
//        leading: Builder(builder: (context) {
//          return IconButton(
//            icon: Icon(Icons.dashboard, color: Colors.white,),
//            onPressed: () {
//              Scaffold.of(context).openDrawer()
//            },);
//        }),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                _globalKey.currentState.openDrawer();
              })
        ],
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
//
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
