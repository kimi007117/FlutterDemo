import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
    const Text(this.data, // 内容
    {
    Key key,
    this.style, // 样式
    this.strutStyle, // 使用的支柱风格
    this.textAlign, // 对齐方式
    this.textDirection, // 文本方向
    this.locale, // 用于选择区域特定字形的语言环境
    this.softWrap, // 是否允许换行显示
    this.overflow, // 超出屏幕显示方式
    this.textScaleFactor, // 每个逻辑像素的字体像素数，
    this.maxLines, // 最大行数
    this.semanticsLabel, // 文本的另一个语义标签
    })

    // 可以显示不同样式textSpan的段落。
    const Text.rich(this.textSpan, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    })

    // 需配合Text.rich一起使用
    const TextSpan({
    this.style,
    this.text,
    this.children,
    this.recognizer,
    });

    TextStyle({
    this.inherit: true,         // 为false的时候不显示
    this.color,                    // 颜色
    this.fontSize,               // 字号
    this.fontWeight,           // 字重，加粗也用这个字段  FontWeight.w700
    this.fontStyle,                // FontStyle.normal  FontStyle.italic斜体
    this.letterSpacing,        // 字符间距  就是单个字母或者汉字之间的间隔，可以是负数
    this.wordSpacing,        // 字间距 句字之间的间距
    this.textBaseline,        // 基线，两个值，字面意思是一个用来排字母的，一人用来排表意字的（类似中文）
    this.height,                // 当用来Text控件上时，行高（会乘以fontSize,所以不以设置过大）
    this.decoration,        // 添加上划线，下划线，删除线
    this.decorationColor,    // 划线的颜色
    this.decorationStyle,    // 这个style可能控制画实线，虚线，两条线，点, 波浪线等
    this.debugLabel,
    String fontFamily,    // 字体
    String package,
    }) : fontFamily = package == null ? fontFamily : 'packages/$package/$fontFamily',
    assert(inherit != null);
 */

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextPageState();
  }
}

class _TextPageState extends State<TextPage> {
  List<String> list = List();

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
        Text(
          "hello flutter flutter flutterflutterflutter flutter flutter!",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // 显示不完，就在后面显示点点
          style: TextStyle(
            fontSize: 30.0, // 文字大小
            color: Colors.yellow, // 文字颜色
          ),
        ),
        new Text(
          'inherit: 为 false 的时候不显示',
          style: new TextStyle(
            inherit: true,
          ),
        ),
        new Text(
          'color/fontSize: 字体颜色，字号等',
          style: new TextStyle(
            color: Color.fromARGB(255, 150, 150, 150),
            fontSize: 22.0,
          ),
        ),
        new Text(
          'fontWeight: 字重',
          style: new TextStyle(fontWeight: FontWeight.w700),
        ),
        new Text(
          'fontStyle: FontStyle.italic 斜体',
          style: new TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        new Text(
          'letterSpacing: 字符间距',
          style: new TextStyle(
            letterSpacing: 10.0,
            // wordSpacing: 15.0
          ),
        ),
        new Text(
          'wordSpacing: 字或单词间距',
          style: new TextStyle(
              // letterSpacing: 10.0,
              wordSpacing: 15.0),
        ),
        new Text(
          'textBaseline:这一行的值为TextBaseline.alphabetic',
          style: new TextStyle(textBaseline: TextBaseline.alphabetic),
        ),
        new Text(
          'textBaseline:这一行的值为TextBaseline.ideographic',
          style: new TextStyle(textBaseline: TextBaseline.ideographic),
        ),
        new Text('height: 用在Text控件上的时候，会乘以fontSize做为行高,所以这个值不能设置过大，可以认为是行间距',
            style: new TextStyle(
              height: 2,
            )),
        new Text('decoration: TextDecoration.overline 上划线',
            style: new TextStyle(
                decoration: TextDecoration.overline,
                decorationStyle: TextDecorationStyle.wavy)),
        new Text('decoration: TextDecoration.lineThrough 删除线',
            style: new TextStyle(
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.dashed)),
        new Text('decoration: TextDecoration.underline 下划线',
            style: new TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted)),
        Text.rich(
          TextSpan(
            text: "这段文字是红色",
            style: TextStyle(color: Colors.red),
            children: <TextSpan>[
              TextSpan(
                text: "这段文字是蓝色",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: "这段文字是绿色",
                style: TextStyle(color: Colors.green),
              ),
              TextSpan(
                text: "这段文字是可点击的",
                style: TextStyle(color: Colors.black),
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      var alert = new AlertDialog(
                        title: new Text("Title"),
                        content: new Text("four is tapped"),
                      );
                      showDialog(context: context, child: alert);
                    }
              ),
            ],
          ),
          style: TextStyle(fontSize: 16.0), // 设置整体大小
        ),
      ],
    );
  }
}
