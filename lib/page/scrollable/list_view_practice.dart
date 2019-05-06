import 'package:flutter/material.dart';

class ListViewPractice extends StatelessWidget {
  static const String routeName = "list_view_practice";

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    List<String> items = str.split("");

    Widget divider1 = Divider(
      color: Colors.blue,
      indent: 16,
    );
    Widget divider2 = Divider(color: Colors.green);

    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child:
/*          ListView(
            scrollDirection: Axis.vertical,
            reverse: false,
            primary: true,
            // 安卓风格
            physics: ClampingScrollPhysics(),
//            physics: BouncingScrollPhysics(), // iOS风格
            itemExtent: 80,
            shrinkWrap: true,
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            children: str
                .split("")
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),*/

/*              ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: false,
            primary: true,
            // 安卓风格
            physics: ClampingScrollPhysics(),
//            physics: BouncingScrollPhysics(), // iOS风格
            itemExtent: 80,
            shrinkWrap: true,
            // 是否将列表项（子widget）包裹在AutomaticKeepAlive widget中,在该列表项滑出视口时该列表项不会被GC，
            // 它会使用KeepAliveNotification来保存其状态,如果列表项自己维护其KeepAlive状态，那么此参数必须置为false
            addAutomaticKeepAlives: false,
            // 是否将列表项（子widget）包裹在RepaintBoundary中。当可滚动widget滚动时，
            // 将列表项包裹在RepaintBoundary中可以避免列表项重绘，
            // 但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，
            // 不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，
            // 如果列表项自己维护其KeepAlive状态，那么此参数必须置为false
            addRepaintBoundaries: false,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                items[index],
                textScaleFactor: 2,
              );
            },
          ),*/
              ListView.separated(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Text(
                  items[index],
                  textScaleFactor: 2,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          ),
        ),
      ),
    );
  }
}
