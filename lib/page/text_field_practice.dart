import 'package:flutter/material.dart';

class TextFieldPractice extends StatefulWidget {
  static const String routeName = "text_field_parctice";

  @override
  _TextFieldPracticeState createState() => _TextFieldPracticeState();
}

class _TextFieldPracticeState extends State<TextFieldPractice> {
  var _inputText;
  var _textEditingController = TextEditingController();
  var _unameController = TextEditingController();
  var _pwdController = TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _textEditingController
      // 设置初始值
      ..text = "Hello World!"
      // 监听变化
      ..addListener(() {
        _inputText = _textEditingController.text;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              // 控制键盘回车按钮的行为
              textInputAction: TextInputAction.search,
              // 控制外观，边框样式，hint样式等
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                labelText: "search",
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
                hintText: "search",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0), bottom: Radius.circular(10)),
                ),
                prefix: Text("Pre"),
                suffixIcon: Icon(Icons.add),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
              // 光标控制
              cursorColor: Colors.purpleAccent,
              cursorWidth: 10,
              cursorRadius: Radius.circular(10),
              textAlign: TextAlign.center,
              // 混淆文字，用于密码
              obscureText: true,
              // 最大行数，默认为1，null为无限制
              maxLines: null,
              // 点击完成或搜索后调用，回调参数不同而已
              onEditingComplete: () {},
              onSubmitted: (value) {},
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Form(
                key: _formKey, //设置globalKey，用于后面获取FormState
                autovalidate: true, //开启自动校验
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        autofocus: true,
                        controller: _unameController,
                        decoration: InputDecoration(
                            labelText: "用户名",
                            hintText: "用户名或邮箱",
                            icon: Icon(Icons.person)),
                        // 校验用户名
                        validator: (v) {
                          return v.trim().length > 0 ? null : "用户名不能为空";
                        }),
                    TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                            labelText: "密码",
                            hintText: "您的登录密码",
                            icon: Icon(Icons.lock)),
                        obscureText: true,
                        //校验密码
                        validator: (v) {
                          return v.trim().length > 5 ? null : "密码不能少于6位";
                        }),
                    // 登录按钮
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("登录"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                //在这里不能通过此方式获取FormState，context不对
                                //print(Form.of(context));

                                // 通过_formKey.currentState 获取FormState后，
                                // 调用validate()方法校验用户名密码是否合法，校验
                                // 通过后再提交数据。
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  //验证通过提交数据
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
