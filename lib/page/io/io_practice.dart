import 'package:flutter/cupertino.dart';
import 'package:flutter_app/page/io/pass_arguments_practice.dart';
import 'package:flutter_app/page/io/web_socket_practice.dart';
import 'package:flutter_app/page/list_practice.dart';

import 'file_practice.dart';

class IoPractice extends StatelessWidget {
  static const routeName = "io_practice";

  @override
  Widget build(BuildContext context) {
    return PracticeListView(<SimplePage>[
      SimplePage(title: "WebSocketPractice", route: WebSocketPractice()),
      SimplePage(title: "FilePractice", route: FilePractice()),
      SimplePage(title: "PassArgumentsPractice", route: PassArgumentsPractice()),
    ]);
  }
}
