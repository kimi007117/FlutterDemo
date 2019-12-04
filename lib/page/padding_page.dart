import 'package:flutter/material.dart';

class PaddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaddingPageState();
  }
}

class _PaddingPageState extends State<PaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padding"),
      ),
      body: Container(
//        padding: EdgeInsets.all(10),
//        padding: EdgeInsets.only(left: 2,top: 2,right: 3,bottom: 3),
        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
        child: Text("测试"),
      ),
    );
  }
}
