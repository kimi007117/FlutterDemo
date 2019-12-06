import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/checkbox_widget.dart';

// ignore: slash_for_doc_comments
/**
    Checkbox 复选框:
    activeColor → Color - 激活时的颜色。
    checkColor： 对勾的颜色 默认的是白色
    onChanged → ValueChanged - 改变时触发。
    tristate → bool - 默认这个是false，此时 value 必定不能是null， 可以设置 为 true，此时 value 可以是任意值
    value → bool - 复选框的值，这个值不能是null(除非上面 tristate 是true) ， 用来设置 此 checkbox 是否选中。


    CheckboxListTile 复选框:
    value	是否选中此复选框
    onChanged	监听 当复选框的值应该更改时调用
    activeColor	选中此复选框时要使用的颜色
    title	列表主标题
    subtitle	列表副标题
    isThreeLine	默认false
    dense	此列表平铺是否是垂直密集列表的一部分。
    secondary	显示在复选框前面的小部件
    selected	选中后文字高亮，默认false
    controlAffinity  控件相对于文本的位置，默认 ListTileControlAffinity.platform
 */
class CheckboxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckboxPageState();
  }
}

class _CheckboxPageState extends State<CheckboxPage> {
  List<String> list = List();

  bool isCheck = false;
  List<bool> isChecks = [false, false];

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
        new Center(
          child: new Checkbox(
            value: isCheck,
            checkColor: Colors.yellow,
            activeColor: Colors.red,
            onChanged: (bool) {
              setState(() {
                isCheck = bool;
              });
            },
          ),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isCheck,
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              //控制亲和度  leading按钮显示在文字前面  trailing按钮显示在文字的后面   platform显示样式根据手机当前平台默认显示
              onChanged: (bool) {
                setState(() {
                  isCheck = bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isCheck,
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool) {
                setState(() {
                  isCheck = bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isCheck,
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool) {
                setState(() {
                  isCheck = bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isCheck,
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool) {
                setState(() {
                  isCheck = bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isCheck,
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool) {
                setState(() {
                  isCheck = bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isChecks[0],
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool) {
                setState(() {
                  isChecks[0] = bool;
                });
              }),
        ),
        new Center(
          child: new CheckboxListTile(
              value: isChecks[1],
              title: new Text('张晓'),
              controlAffinity: ListTileControlAffinity.platform,
              onChanged: (bool) {
                setState(() {
                  isChecks[1] = bool;
                });
              }),
        ),
        CheckboxListTile(
          secondary: const Icon(Icons.shutter_speed),
          title: const Text('硬件加速'),
          subtitle: Text('12小时58分钟后响铃'),
          value: this.isChecks[1],
          onChanged: (bool value) {
            setState(() {
              this.isChecks[1] = !this.isChecks[1];
            });
          },
        ),
        Center(
            child: InkWell(
          onTap: () {
            setState(() {
              isChecks[0] = !isChecks[0];
            });
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: isChecks[0]
                  ? Icon(
                      Icons.check_circle,
                      size: 25.0,
                      color: Colors.lightBlue,
                    )
                  : Icon(
                      Icons.panorama_fish_eye,
                      size: 25.0,
                      color: Colors.grey,
                    ),
            ),
          ),
        )),
        CustomerCheckbox(
          value: isChecks[1],
          checkColor: Colors.white,
          activeColor: Colors.greenAccent,
          isCircle: true,
          width: 30,
          onChanged: (bool) {
            setState(() {
              this.isChecks[1] = !this.isChecks[1];
            });
          },
        ),
      ],
    );
  }
}
