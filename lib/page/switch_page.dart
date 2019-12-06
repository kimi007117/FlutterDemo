import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
    value	当前开关状态 布尔值
    onChanged	监听（开关状态改变时调用）
    activeColor	打开 状态 轨道 和 按钮颜色
    activeTrackColor	打开 状态轨道颜色
    inactiveThumbColor	关闭 状态按钮颜色
    inactiveTrackColor	关闭 状态轨道颜色
    activeThumbImage	打开 状态下按钮图片
    inactiveThumbImage	关闭 状态下按钮图片
    materialTapTargetSize	配置tap目标的最小大小
    dragStartBehavior	确定处理拖动启动行为的方式。（没看出有什么变化）

    Flutter 还提供了仿苹果的Switch组件CupertinoSwitch：
    value	当前开关状态 布尔值
    onChanged	监听（开关状态改变时调用）
    activeColor	打开 状态 轨道 和 按钮颜色
 */
class SwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchPageState();
  }
}

class _SwitchPageState extends State<SwitchPage> {
  List<String> list = List();

  bool isCheck = false;

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
        Switch(
          activeColor: Colors.red,
          activeTrackColor: Colors.yellow,
          inactiveThumbColor: Colors.pink[200],
          inactiveTrackColor: Colors.grey,
          activeThumbImage: AssetImage('images/icon_disable.png'),
          inactiveThumbImage: AssetImage('images/icon_enable.png'),
//      dragStartBehavior:DragStartBehavior.start,

          value: this.isCheck,
          onChanged: (bool v) {
            setState(() {
              this.isCheck = v;
            });
          },
        ),
        CupertinoSwitch(
          value: this.isCheck,
          onChanged: (bool value) {
            setState(() {
              this.isCheck = value;
            });
          },
        ),
        Switch(
          value: this.isCheck,
          activeColor: Colors.greenAccent, // 激活时原点颜色
          onChanged: (bool val) {
            this.setState(() {
              this.isCheck = !this.isCheck;
            });
          },
        ),
        Switch(
            value: this.isCheck,
            activeColor: Colors.greenAccent, // 激活时原点颜色
            onChanged: null),
        Switch.adaptive(
            value: isCheck,
            onChanged: (bool value) {
              setState(() {
                isCheck = value;
              });
            }),
        SwitchListTile(
            title: Text('SwitchListTile的简单使用（默认打开蓝色）'),
            value: isCheck,
            subtitle: Text('简单使用'),
            onChanged: (bool value) {
              setState(() {
                isCheck = value;
              });
            }),
      ],
    );
  }
}
