import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/button_page.dart';
import 'package:flutter_app/page/checkbox_page.dart';
import 'package:flutter_app/page/custom_scroll_view_page.dart';
import 'package:flutter_app/page/expanded_page.dart';
import 'package:flutter_app/page/grid_view_page.dart';
import 'package:flutter_app/page/ink_well_page.dart';
import 'package:flutter_app/page/list_view_page.dart';
import 'package:flutter_app/page/loading_page.dart';
import 'package:flutter_app/page/margin_page.dart';
import 'package:flutter_app/page/menu_page.dart';
import 'package:flutter_app/page/nested_scroll_view_page.dart';
import 'package:flutter_app/page/padding_page.dart';
import 'package:flutter_app/page/popup_page.dart';
import 'package:flutter_app/page/popup_page2.dart';
import 'package:flutter_app/page/radio_page.dart';
import 'package:flutter_app/page/should_rebuild_page.dart';
import 'package:flutter_app/page/switch_page.dart';
import 'package:flutter_app/page/text_page.dart';
import 'package:flutter_app/page/visibility_page.dart';

//void main() => runApp(MyApp());

void main(){
  runApp(MyApp());

//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

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
            getItem(context, "InkWellPage", InkWellPage()),
            getItem(context, "PaddingPage", PaddingPage()),
            getItem(context, "MarginPage", MarginPage()),
            getItem(context, "ExpandedPage", ExpandedPage()),
            getItem(context, "ListViewPage", ListViewPage()),
            getItem(context, "GridViewPage", GridViewPage()),
            getItem(context, "CustomScrollViewPage", CustomScrollViewPage()),
            getItem(context, "ButtonPage", ButtonPage()),
            getItem(context, "NestedScrollViewPage", NestedScrollViewPage()),
            getItem(context, "VisibilityPage", VisibilityPage()),
            getItem(context, "TextPage", TextPage()),
            getItem(context, "CheckboxPage", CheckboxPage()),
            getItem(context, "RadioPage", RadioPage()),
            getItem(context, "SwitchPage", SwitchPage()),
            getItem(context, "MenuPage", MenuPage()),
            getItem(context, "LoadingPage", LoadingPage()),
            getItem(context, "ShouldRebuildPage", ShouldRebuildPage()),
          ],
        ));
  }

  ListTile getItem(BuildContext context, String title, Widget widget) {
    return ListTile(
      title: Text(title),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => widget));
      },
    );
  }
}
