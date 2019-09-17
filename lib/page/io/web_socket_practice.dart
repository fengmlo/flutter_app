import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketPractice extends StatefulWidget {
  @override
  _WebSocketPracticeState createState() => _WebSocketPracticeState();
}

class _WebSocketPracticeState extends State<WebSocketPractice> {
  TextEditingController _controller = TextEditingController();
  WebSocketChannel _webSocketChannel;

  @override
  void initState() {
    super.initState();
    _webSocketChannel = IOWebSocketChannel.connect("ws://echo.websocket.org");
  }

  @override
  void dispose() {
    _webSocketChannel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebSocket Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Send a message"),
              ),
            ),
            StreamBuilder(
              stream: _webSocketChannel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(snapshot.hasData ? "${snapshot.data}" : ""),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: "Send message",
        child: Icon(Icons.send),
      ),
    );
  }

  _sendMessage() {
    var text = _controller.text;
    if (text.isNotEmpty) {
      _webSocketChannel.sink.add(text);
      print("发送成功");
    }
  }
}
