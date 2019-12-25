import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/title_bar_widget.dart';
import 'package:flutter_app/common/widget/custom_app_bar.dart';
import 'package:flutter_app/common/widget/loading_widget.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingPageState();
  }
}

class _LoadingPageState extends State<LoadingPage> {
  List<String> list = List();

  bool _loading = false;

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
    return LoadingWidget(
        loading: _loading,
//        msg: '正在加载...',
        child: Scaffold(
          appBar: CustomAppBar(
            backgroundColor: Colors.blueAccent,
            child: TitleBarWidget(
              title: '测试',
              onBackPressed: onBack,
            ),
          ),
          body: buildBody(),
        ));
  }

  void onBack() {
    print("页面返回");
    Navigator.pop(context);
  }

  Widget buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: () => _onRefresh(),
            child: Text('显示加载动画'),
          ),
        ],
      ),
    );
  }

//  Widget buildBody() {
//    return Center(
//      child: RaisedButton(
//        onPressed: () => _onRefresh(),
//        child: Text('显示加载动画'),
//      ),
//    );
//  }

  Future<Null> _onRefresh() async {
    setState(() {
      _loading = !_loading;
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = !_loading;
      });
    });
  }
}
