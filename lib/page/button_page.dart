import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: slash_for_doc_comments
/**
    RaisedButton Material Design中的button， 一个凸起的材质矩形按钮。

    FlatButton Material Design中的button，一个没有阴影的材质设计按钮。

    OutlineButton Material Design中的button，RaisedButton和FlatButton之间的交叉：一个带边框的背景透明的按钮，当按下按钮时，其高度增加，背景变得不透明。

    三个控件都继承于MaterialButton

    RaisedButton({
    Key key,
    //点击按钮的回调出发事件
    @required VoidCallback onPressed,
    //水波纹高亮变化回调
    ValueChanged<bool> onHighlightChanged,
    //按钮的样式（文字颜色、按钮的最小大小，内边距以及shape）[ Used with [ButtonTheme] and [ButtonThemeData] to define a button's base
    //colors, and the defaults for the button's minimum size, internal padding,and shape.]
    ButtonTextTheme textTheme,
    //文字颜色
    Color textColor,
    //按钮被禁用时的文字颜色
    Color disabledTextColor,
    //按钮的颜色
    Color color,
    //按钮被禁用时的颜色
    Color disabledColor,
    //按钮的水波纹亮起的颜色
    Color highlightColor,
    //水波纹的颜色
    Color splashColor,
    //按钮主题高亮
    Brightness colorBrightness,
    //按钮下面的阴影长度
    double elevation,
    //按钮高亮时的下面的阴影长度
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
    }

    FloatingActionButton({
    Key key,
    //  按钮上的组件，可以是Text、icon, etc.
    this.child,
    //长按提示
    this.tooltip,
    // child的颜色（尽在child没有设置颜色时生效）
    this.foregroundColor,
    //背景色，也就是悬浮按键的颜色
    this.backgroundColor,
    this.heroTag = const _DefaultHeroTag(),
    //阴影长度
    this.elevation = 6.0,
    //高亮时阴影长度
    this.highlightElevation = 12.0,
    //按下事件回调
    @required this.onPressed,
    //是小图标还是大图标
    this.mini = false,
    //按钮的形状(例如：矩形Border，圆形图标CircleBorder)
    this.shape = const CircleBorder(),
    this.clipBehavior = Clip.none,
    this.materialTapTargetSize,
    this.isExtended = false,
    })

    DropdownButton({
    Key key,
    //要显示的列表
    List<DropdownMenuItem<T>> @required this.items,
    //下拉菜单选中的值（注意：在初始化时，要么为null，这时显示默认hint的值；
    // 如果自己设定值，则值必须为列表中的一个值，如果不在列表中，会抛出异常）
    T value,
    //默认显示的值
    Widget hint,
    Widget disabledHint,
    //选中时的回调
    ValueChanged<T>  @required this.onChanged,
    this.elevation = 8,
    this.style,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    })

    PopupMenuButton({
    Key key,
    //构建弹出式列表数据
    PopupMenuItemBuilder<T> @required this.itemBuilder,
    //初始值
    T initialValue,
    //选中时的回调
    PopupMenuItemSelected<T> onSelected;,
    //当未选中任何条目后弹窗消失时的回调
    final PopupMenuCanceled onCanceled;,
    //
    this.tooltip,
    //弹窗阴影高度
    this.elevation = 8.0,
    //边距
    this.padding = const EdgeInsets.all(8.0),
    //弹窗的位置显示的组件，默认为三个点...
    this.child,
    //跟child效果一致
    this.icon,
    //弹窗偏移位置
    this.offset = Offset.zero,
    })

    const ButtonBar({
    Key key,
    //子组件的间隔样式
    this.alignment = MainAxisAlignment.end,
    this.mainAxisSize = MainAxisSize.max,
    //子children
    this.children = const <Widget>[],
    })
 */
class ButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonPageState();
  }
}

const List<String> models = const <String>['白天模式', '护眼模式', '黑夜模式'];

class _ButtonPageState extends State<ButtonPage> {
  List<String> list = List();

  String title = models[0];

  List<PopupMenuEntry<String>> _getItemBuilder() {
    return models
        .map((item) => PopupMenuItem<String>(
              child: Text(item),
              value: item, //value一定不能少
            ))
        .toList();
  }

  void _select(String value) {
    setState(() {
      title = value;
    });
  }

  //返回城市列表，写法一
  List<DropdownMenuItem> _getItems() {
    List<DropdownMenuItem> items = new List();
    //value 表示DropdownButton.onChanged的返回值
    items.add(DropdownMenuItem(child: Text("北京"), value: "BJ"));
    items.add(DropdownMenuItem(child: Text("上海"), value: "SH"));
    items.add(DropdownMenuItem(child: Text("广州"), value: "GZ"));
    items.add(DropdownMenuItem(child: Text("深圳"), value: "SZ"));
    return items;
  }

//返回城市列表，写法二
  List<DropdownMenuItem<String>> _getCityList() {
    var list = ["北京", "上海", "广州", "深圳"];
    return list
        .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ))
        .toList();
  }

  //  下拉菜单选中的值（注意：在初始化时，要么为null，这时显示默认hint的值；
// 如果自己设定值，则值必须为列表中的一个值，如果不在列表中，会抛出异常）
  String selectValue;

  _onChanged(String value) {
    //更新对象的状态
    setState(() {
      selectValue = value;
    });
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Button"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return _getItemBuilder();
              },
            )
          ],
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return ListView(
      children: <Widget>[
        MaterialButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.grey,
//          elevation: 0,
          highlightElevation: 0,
          // 水波纹颜色
          highlightColor: Colors.pink,
          // 按下去颜色
          child: new Text('MaterialButton'),
          onPressed: () {
            Fluttertoast.showToast(msg: "MaterialButton");
          },
        ),
        RaisedButton(
          // Flutter设置按钮disable，给 onPressed 置为 null
          color: Colors.blue,
          textColor: Colors.white,
          disabledTextColor: Color(0xFF999999),
          disabledColor: Color(0xFFCCCCCC),
          child: new Text('disabled'),
          onPressed: null,
        ),
        RaisedButton(
          textTheme: ButtonTextTheme.accent,
          color: Colors.teal,
          highlightColor: Colors.deepPurpleAccent,
          splashColor: Colors.deepOrangeAccent,
          colorBrightness: Brightness.dark,
          elevation: 5.0,
          highlightElevation: 10.0,
          disabledElevation: 20.0,
          onPressed: () {
            //TODO
          },
          child: Text(
            'RaisedButton',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
        FloatingActionButton(
          child: Icon(Icons.access_alarm),
          tooltip: "ToolTip",
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          shape: const Border(),
          onPressed: () {
            //click callback
          },
        ),
        FlatButton(
            // 一个扁平的Material按钮
            onPressed: () {},
            child: Text(
              "FlatBtn",
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            )),
        IconButton(
            // 图标按钮，按下时会产生水波纹效果。
            onPressed: () {
              //click callback
            },
            icon: Icon(
              Icons.cake,
            )),
        DropdownButton(
          // Material Style 下拉菜单按钮
          //要显示的条目
          items: _getItems(),
          //默认显示的值
          hint: Text("请选择城市"),
          //下拉菜单选中的值（注意：在初始化时，要么为null，这时显示默认hint的值；
          // 如果自己设定值，则值必须为列表中的一个值，如果不在列表中，会抛出异常）
          value: selectValue,
          onChanged: (itemValue) {
            //itemValue为选中的值
            print("itemValue=$itemValue");
            _onChanged(itemValue);
          },
        ),
        FlatButton(
            onPressed: () {
              PopupMenuButton<String>(
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return _getItemBuilder();
                },
              );
            },
            child: Text(
              "FlatBtn",
              style: TextStyle(fontSize: 20, color: Colors.deepPurple),
            )),
        ButtonBar(
          // 水平排列的按钮组
          children: <Widget>[
            Text("ButtonBar0"),
            Icon(Icons.ac_unit),
            Text("ButtonBar1")
          ],
        ),
        SafeArea(
          // 防止刘海屏和iPhone X类似的底部bottom的区域
          child: Align(
            alignment: Alignment(-1, -1),
            child: Container(
              child: Text(
                "Hello",
              ),
            ),
          ),
        ),
        MaterialButton(
          key: ValueKey("text"),
          child: Text("MaterialButton"),
          onPressed: pressedBtn(context),
          onHighlightChanged: onHighlightChanged(context),
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.blue,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
          disabledColor: Colors.grey,
          highlightColor: Colors.grey,
          // 按下的背景色
          splashColor: Colors.green,
          // 水波纹颜色
          colorBrightness: Brightness.light,
          // 主题
          elevation: 10,
          highlightElevation: 10,
          disabledElevation: 10,
          padding: EdgeInsets.all(10),
//       MaterialButton shape 子类才起效
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                  color: Color(0xFFFFFFFF),
                  style: BorderStyle.solid,
                  width: 2)),
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          animationDuration: Duration(seconds: 1),
          minWidth: 200,
          height: 50,
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: pressedBtn(context),
          onHighlightChanged: onHighlightChanged(context),
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.blue,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
          disabledColor: Colors.grey,
          highlightColor: Colors.grey,
          // 按下的背景色
          splashColor: Colors.green,
          // 水波纹颜色
          colorBrightness: Brightness.light,
          // 主题
          elevation: 10,
          highlightElevation: 10,
          disabledElevation: 10,
          padding: EdgeInsets.all(10),
          // RaisedButton 才起效
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                  color: Color(0xFFFFF00F),
                  style: BorderStyle.solid,
                  width: 2)),
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          animationDuration: Duration(seconds: 1),
//      minWidth: 200,
//      height: 50,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.menu),
          label: Text("RaisedButton.icon"),
          onPressed: pressedBtn(context),
          onHighlightChanged: onHighlightChanged(context),
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.blue,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
          disabledColor: Colors.grey,
          highlightColor: Colors.red,
          // 按下的背景色
//      splashColor: Colors.green,// 水波纹颜色
          colorBrightness: Brightness.light,
          // 主题
          elevation: 10,
          highlightElevation: 10,
          disabledElevation: 10,
//      padding: EdgeInsets.all(10),
          // RaisedButton 才起效
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                  color: Color(0xFFF0F00), style: BorderStyle.solid, width: 2)),
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          animationDuration: Duration(seconds: 1),
//      minWidth: 200,
//      height: 50,
        ),
        FlatButton(
          child: Text("FlatButton"),
          onPressed: pressedBtn(context),
          onHighlightChanged: onHighlightChanged(context),
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.yellow,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
          disabledColor: Colors.grey,
          highlightColor: Colors.grey,
          // 按下的背景色
          splashColor: Colors.transparent,
          // 水波纹颜色
          colorBrightness: Brightness.light,
          // 主题
//      elevation: 10,
//      highlightElevation: 10,
//      disabledElevation: 10,
          padding: EdgeInsets.all(10),
//       RaisedButton 才起效
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                  color: Color(0xFFF9F3FF),
                  style: BorderStyle.solid,
                  width: 2)),
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
//      animationDuration: Duration(seconds:1),
//      minWidth: 200,
//      height: 50,
        ),
        FlatButton.icon(
          icon: Icon(
            Icons.menu,
            color: Colors.green,
          ),
          label: Text("FlatButton.icon"),
          onPressed: pressedBtn(context),
          onHighlightChanged: onHighlightChanged(context),
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.yellow,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
          disabledColor: Colors.grey,
          highlightColor: Colors.red,
          // 按下的背景色
          splashColor: Colors.green,
          // 水波纹颜色
          colorBrightness: Brightness.light,
          // 主题
//      elevation: 10,
//      highlightElevation: 10,
//      disabledElevation: 10,
//      padding: EdgeInsets.all(10),
          // RaisedButton 才起效
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                  color: Color(0xFF6FFF00),
                  style: BorderStyle.solid,
                  width: 2)),
          clipBehavior: Clip.antiAlias,
          materialTapTargetSize: MaterialTapTargetSize.padded,
//      animationDuration: Duration(seconds:1),
//      minWidth: 200,
//      height: 50,
        ),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: pressedBtn(context),
//      onHighlightChanged: onHighlightChanged,
          textTheme: ButtonTextTheme.accent,
          textColor: Colors.blueAccent,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
//      disabledColor: Colors.grey,
          highlightColor: Color(0xFF2962FF),
          // 按下的背景色
          splashColor: Colors.red,
          // 水波纹颜色
//      colorBrightness: Brightness.light,   // 主题
//      elevation: 10,
          highlightElevation: 10,
//      disabledElevation: 10,
          padding: EdgeInsets.all(10),
//       RaisedButton 才起效
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                  color: Color(0xFFFFFF00),
                  style: BorderStyle.solid,
                  width: 2)),
          clipBehavior: Clip.antiAlias,
//      materialTapTargetSize: MaterialTapTargetSize.padded,
//      animationDuration: Duration(seconds:1),
//      minWidth: 200,
//      height: 50,
        ),
        OutlineButton.icon(
          icon: Icon(
            Icons.menu,
            color: Colors.green,
          ),
          label: Text("OutlineButton.icon"),
          onPressed: pressedBtn(context),
//      onHighlightChanged: onHighlightChanged,
          textTheme: ButtonTextTheme.normal,
          textColor: Colors.yellow,
          disabledTextColor: Colors.red,
          color: Color(0xFF82B1FF),
//      disabledColor: Colors.grey,
          highlightColor: Colors.red,
          // 按下的背景色
          splashColor: Colors.green,
          // 水波纹颜色
//      colorBrightness: Brightness.light,   // 主题
//      elevation: 10,
          highlightElevation: 10,
//      disabledElevation: 10,
          padding: EdgeInsets.all(10),
          // RaisedButton 才起效
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          clipBehavior: Clip.antiAlias,
//      materialTapTargetSize: MaterialTapTargetSize.padded,
//      animationDuration: Duration(seconds:1),
//      minWidth: 200,
//      height: 50,
        ),
        CupertinoButton(
          child: Text("CupertinoButton"),
          onPressed: pressedBtn(context),
          color: Colors.blue,
          disabledColor: Colors.grey,
          padding: EdgeInsets.all(10),
          minSize: 50,
          pressedOpacity: 0.8,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ],
    );
  }

  ValueChanged<bool> onHighlightChanged(BuildContext context) {
    return (bool b) {
      Fluttertoast.showToast(msg: "onHighlightChanged:" + b.toString());
    } ;
  }

  VoidCallback pressedBtn(BuildContext context) {
    return () {
      Fluttertoast.showToast(msg: "pressedBtn:");
    };
  }
}
