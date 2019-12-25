import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExpandedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpandedPageState();
  }
}

/// Flexible和 Expanded的区别是：
/// Flexible是一个控制Row、Column、Flex等子组件如何布局的组件。
/// Flexible组件可以使Row、Column、Flex等子组件在主轴方向有填充可用空间的能力(例如，Row在水平方向，Column在垂直方向)，但是它与Expanded组件不同，它不强制子组件填充可用空间。
/// Flexible组件必须是Row、Column、Flex等组件的后裔，并且从Flexible到它封装的Row、Column、Flex的路径必须只包括StatelessWidgets或StatefulWidgets组件(不能是其他类型的组件，像RenderObjectWidgets)。
/// Row、Column、Flex会被Expanded撑开，充满主轴可用空间。

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Padding"),
        ),
        body: Column(
          children: <Widget>[
            Row(children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: '点击红色按钮事件');
                  print('点击红色按钮事件');
                },
                color: const Color(0xffcc0000),
                child: new Text('红色按钮'),
              ),
              new Expanded(
                flex: 1,
                child: new RaisedButton(
                  onPressed: () {
                    print('点击黄色按钮事件');
                  },
                  color: const Color(0xfff1c232),
                  child: new Text('黄色按钮'),
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print('点击粉色按钮事件');
                },
                color: const Color(0xffea9999),
                child: new Text('粉色按钮'),
              ),
            ]),
            Row(children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  print('点击红色按钮事件');
                },
                color: const Color(0xffcc0000),
                child: new Text('红色按钮'),
              ),
              new Flexible(
                flex: 1,
                child: new RaisedButton(
                  onPressed: () {
                    print('点击黄色按钮事件');
                  },
                  color: const Color(0xfff1c232),
                  child: new Text('黄色按钮'),
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print('点击粉色按钮事件');
                },
                color: const Color(0xffea9999),
                child: new Text('粉色按钮'),
              ),
            ]),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Icon(Icons.account_balance),
                    color: Colors.amberAccent,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Icon(Icons.account_balance_wallet),
                    color: Colors.greenAccent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(Icons.view_compact),
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          print('点击红色按钮事件');
                        },
                        color: const Color(0xffcc0000),
                        child: new Text('红色按钮'),
                      ),
                    ),
                    new Flexible(
                      flex: 2,
                      child: new RaisedButton(
                        onPressed: () {
                          print('点击黄色按钮事件');
                        },
                        color: const Color(0xfff1c232),
                        child: new Text('黄色按钮'),
                      ),
                    ),
                  ],
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  print('点击粉色按钮事件');
                },
                color: const Color(0xffea9999),
                child: new Text('粉色按钮'),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildButtonColumn(context, Icons.call, "Call"),
                _buildButtonColumn(context, Icons.near_me, "Route"),
                _buildButtonColumn(context, Icons.share, "Share"),
              ],
            ),
          ],
        ));
  }

  Column _buildButtonColumn(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      //列布局
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}
