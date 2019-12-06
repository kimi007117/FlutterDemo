import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_app/common/widget/visibility_widget.dart'
    as CustomVisibility;
import 'package:flutter_app/common/widget/visibility_widget.dart';

/// Flutter隐藏控件方式
/// 由于 Flutter 本着“一切皆组件”的原则，这类型的设置基本上只能通过组件去设置
///
/// Visibility({
/// Key key,
/// @required this.child,
/// this.replacement = const SizedBox.shrink(), //用于替换的Widget，如果不复写那么就是默认空的SizedBox
/// this.visible = true, //控制child 是否可见，当为false的时候显示replacement
/// this.maintainState = false,  //是否在不可见的情况下维护WidgetState
/// this.maintainAnimation = false, //是否在widget不可见时保持动画
/// this.maintainSize = false,// 是否预留位置
/// this.maintainSemantics = false,// 可访问性
/// this.maintainInteractivity = false, // 是否在隐藏时维持交互
/// }

class VisibilityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VisibilityPageState();
  }
}

class _VisibilityPageState extends State<VisibilityPage> {
  List<String> list = List();

  bool isVisible1 = true;
  bool isVisible2 = true;
  bool isVisible3 = true;
  bool isVisible4 = true;
  bool isVisible5 = true;
  bool isVisible6 = true;
  bool isVisible7 = true;
  bool isVisible8 = true;
  bool isVisible9 = true;
  bool isVisible10 = true;
  bool isVisible11 = true;

  @override
  void initState() {
    super.initState();
    getListData();
  }

  void getListData() {
    List<String> l = List();
    for (var i = 0; i <= 50; i++) {
      l.add('Text： $i');
    }
    setState(() {
      this.list = l;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("DemoPage"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CustomVisibility.Visibility(
              // 自定义Visibility 组件
              child: Text('Hello World INVISIBLE'),
              visible: isVisible1 ? Visible.VISIBLE : Visible.INVISIBLE,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('INVISIBLE'),
              onPressed: () {
                onVisible1Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            CustomVisibility.Visibility(
              child: Text('Hello World GONE'),
              visible: isVisible2 ? Visible.VISIBLE : Visible.GONE,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('GONE'),
              onPressed: () {
                onVisible2Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            CustomVisibility.Visibility(
              child: Text('Hello World VISIBLE'),
              visible: isVisible3 ? Visible.VISIBLE : Visible.VISIBLE,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('VISIBLE'),
              onPressed: () {
                onVisible3Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            prefix0.Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              // 官方Visibility 组件
              child: Text('Hello World Visibility INVISIBLE'),
              visible: isVisible4,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Visibility INVISIBLE'),
              onPressed: () {
                onVisible4Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            prefix0.Visibility(
              // 官方Visibility 组件
              child: Text('Hello World Visibility GONE'),
              visible: isVisible10,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Visibility GONE'),
              onPressed: () {
                onVisible10Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            prefix0.Visibility(
              // 官方Visibility 组件
              child: Text('Hello World Visibility replacement'),
              visible: isVisible11,
              replacement: Text('Hello World Visibility new'),
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Visibility replacement'),
              onPressed: () {
                onVisible11Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Offstage(
              // OffStage 组件
              child: Text('Hello World Offstage'),
              offstage: !isVisible5,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Offstage'),
              onPressed: () {
                onVisible5Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Opacity(
              // Opacity 组件
              child: Text('Hello World Opacity'),
              opacity: isVisible6 ? 1 : 0,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Opacity'),
              onPressed: () {
                onVisible6Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            AnimatedOpacity(
              // AnimatedOpacity 组件
              duration: Duration(seconds: 1),
              child: Text('Hello World AnimatedOpacity'),
              opacity: isVisible9 ? 1 : 0,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('AnimatedOpacity'),
              onPressed: () {
                onVisible9Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              // Opacity 组件
              child: Text('Hello World Size'),
              height: isVisible7 ? 20 : 0,
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('Size'),
              onPressed: () {
                onVisible7Listener();
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              // Opacity 组件
              child: isVisible8 ? Text('Hello World 空组件占位') : Container(),
            ),
            SizedBox(width: 10),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text('空组件占位'),
              onPressed: () {
                onVisible8Listener();
              },
            ),
          ],
        ),
      ],
    );
  }

  void onVisible1Listener() {
    setState(() {
      isVisible1 = !isVisible1;
    });
  }

  void onVisible2Listener() {
    setState(() {
      isVisible2 = !isVisible2;
    });
  }

  void onVisible3Listener() {
    setState(() {
      isVisible3 = !isVisible3;
    });
  }

  void onVisible4Listener() {
    setState(() {
      isVisible4 = !isVisible4;
    });
  }

  void onVisible5Listener() {
    setState(() {
      isVisible5 = !isVisible5;
    });
  }

  void onVisible6Listener() {
    setState(() {
      isVisible6 = !isVisible6;
    });
  }

  void onVisible7Listener() {
    setState(() {
      isVisible7 = !isVisible7;
    });
  }

  void onVisible8Listener() {
    setState(() {
      isVisible8 = !isVisible8;
    });
  }

  void onVisible9Listener() {
    setState(() {
      isVisible9 = !isVisible9;
    });
  }

  void onVisible10Listener() {
    setState(() {
      isVisible10 = !isVisible10;
    });
  }

  void onVisible11Listener() {
    setState(() {
      isVisible11 = !isVisible11;
    });
  }
}
