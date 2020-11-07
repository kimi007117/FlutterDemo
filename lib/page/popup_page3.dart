import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/popup_window.dart';
import 'package:flutter_app/common/widget/popup_window2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupPage3 extends StatefulWidget {
  @override
  _PopupPage3State createState() => _PopupPage3State();
}

class _PopupPage3State extends State<PopupPage3> {
  List<String> list = List();

  GlobalKey popBottomKey;

  @override
  void initState() {
    super.initState();
    getListData();
    popBottomKey = GlobalKey();
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
        title: Text("DemoPage"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        FlatButton(
            key: popBottomKey,
            onPressed: () {
              PopupWindow.showPopWindow(context, "", popBottomKey,
                  PopDirection.bottom, buildPop(), -10);
            },
            color: Colors.green,
            child: Text(
              "bottom",
              style: TextStyle(color: Colors.white),
            )),
        PopupWindowButton(
          offset: Offset(0, 200),
          child: Text(
            "bottom",
            style: TextStyle(color: Colors.blueAccent),
          ),
          window: Container(
            padding: EdgeInsets.all(50),
            alignment: Alignment.center,
            color: Colors.greenAccent,
            height: 200,
            child: Container(
              color: Colors.white,
              height: 50,
            ),
          ),
        )
      ],
    );
  }


  Widget buildPop() {
    return Container(
      width: 150.0,
      height: 320.0,
      child: Stack(
        children: <Widget>[
          new Image(
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage("images/bg_pop_list_left.png")),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: buildPopup(),
          ),
        ],
      ),
    );
  }

  Widget buildPopup() {
    return ListView.builder(
//      shrinkWrap: true,
//      scrollDirection: Axis.horizontal,  // horizontal时必须指定itemExtent
//      itemExtent: 160,
      itemCount: list.length,
//      scrollDirection: Axis.vertical,
//      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text(
            list[index],
            maxLines: 1,
            overflow: TextOverflow.clip,
            softWrap: true,
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}

class CaseFilterPopup extends StatefulWidget {
  final List<String> listData;

  CaseFilterPopup({this.listData});

  @override
  State<StatefulWidget> createState() {
    return _CaseFilterPopupState();
  }
}

class _CaseFilterPopupState extends State<CaseFilterPopup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
//      scrollDirection: Axis.horizontal,  // horizontal时必须指定itemExtent
//      itemExtent: 160,
          itemCount: widget.listData.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(widget.listData[index]),
            );
          },
        ),
      ),
    );
  }
}
