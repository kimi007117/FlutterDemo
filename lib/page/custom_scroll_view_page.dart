import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomScrollViewPageState();
  }
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("CustomScrollView"),
      ),
      body: buildCustomScrollView(),
    );
  }

  Widget buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 3.0, //子控件宽高比
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(list[index]),
                ),
              );
            },
            childCount: list.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 200,
            child: Image.network(
              "http://pic37.nipic.com/20140113/8800276_184927469000_2.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            //返回组件集合
            List.generate(list.length, (int index) {
              //返回 组件
              return GestureDetector(
                onTap: () {
                  print("点击$index");
                },
                child: Card(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: Text(list[index]),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
