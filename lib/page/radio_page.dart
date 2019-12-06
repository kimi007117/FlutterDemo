import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
    Radio 单选按钮:
    value	此单选按钮表示的值（可设定为id）
    groupValue	此组单选按钮的当前选定值
    onChanged	监听
    activeColor	选择此单选按钮时使用的颜色
    materialTapTargetSize	配置tap目标的最小大小


    RadioListTile  单选按钮:
    value	此单选按钮表示的值（可设定为id）
    groupValue	此组单选按钮的当前选定值
    onChanged	监听
    activeColor	选中此复选框时要使用的颜色
    title	列表主标题
    subtitle	列表副标题
    isThreeLine	默认false
    dense	此列表平铺是否是垂直密集列表的一部分。
    secondary	显示在复选框前面的小部件
    selected	选中后文字高亮，默认false
    controlAffinity  控件相对于文本的位置，默认 ListTileControlAffinity.platform
 */
class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RadioPageState();
  }
}

class _RadioPageState extends State<RadioPage> {
  List<String> list = List();

  String _value = '';

  int groupValue = 1;

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
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
                value: 'a',
                activeColor: Colors.blue,
                groupValue: _value,
                onChanged: (newValue) {
                  setState(() {
                    _value = newValue;
                  });
                }),
            Text('开')
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 'b',
                activeColor: Colors.blue,
                groupValue: _value,
                onChanged: (newValue) {
                  setState(() {
                    _value = newValue;
                  });
                }),
            Text('关')
          ],
        ),
        new Radio(value: 0, groupValue: 0, onChanged: null),
        //onChanged为null表示按钮不可用
        new Radio(
            value: 1,
            groupValue: groupValue, //当value和groupValue一致的时候则选中
            activeColor: Colors.red,
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new Radio(
            value: 2,
            groupValue: groupValue,
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new Radio(
            value: 3,
            groupValue: groupValue,
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new Radio(
            value: 4,
            groupValue: groupValue,
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new Radio(
            value: 5,
            groupValue: groupValue,
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new Radio(
            value: 6,
            groupValue: groupValue,
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new RadioListTile(
            value: 7,
            groupValue: groupValue,
            title: new Text('小张'),
            secondary: const Icon(Icons.shutter_speed),
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new RadioListTile(
            value: 8,
            groupValue: groupValue,
            secondary: const Icon(Icons.shutter_speed),
            title: new Text('小林'),
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new RadioListTile(
            value: 9,
            secondary: const Icon(Icons.shutter_speed),
            groupValue: groupValue,
            title: new Text('小王'),
            onChanged: (T) {
              updateGroupValue(T);
            }),
        new RadioListTile(
            value: 10,
            secondary: const Icon(Icons.shutter_speed),
            groupValue: groupValue,
            title: new Text('小红'),
            onChanged: (T) {
              updateGroupValue(T);
            })
      ],
    );
  }

  void updateGroupValue(int v) {
    setState(() {
      groupValue = v;
    });
  }
}
