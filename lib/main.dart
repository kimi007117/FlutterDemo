import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/popup_page.dart';
import 'package:flutter_app/page/popup_page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    //在 initState 方法中获取 BuildContext
    Future.delayed(Duration(seconds: 0), () {
      print(MediaQuery.of(context).size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter UI"),
        ),
        body: ListView(
          children: <Widget>[
            getItem(context, "PopupPage", PopupPage()),
            getItem(context, "PopupPage2", PopupPage2(title: 'PopupPage2',)),
          ],
        ));
  }

  ListTile getItem(BuildContext context, String title, Widget widget) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => widget));
      },
    );
  }
}
