import 'package:flutter/material.dart';
import 'package:flutter_app/item/customer_item1.dart';
import 'package:fluttertoast/fluttertoast.dart';


/// GridView默认构造函数可以类比于ListView默认构造函数，适用于有限个数子元素的场景，因为GridView组件会一次性全部渲染children中的子元素组件；
/// GridView.builder构造函数可以类比于ListView.builder构造函数，适用于长列表的场景，因为GridView组件会根据子元素是否出现在屏幕内而动态创建销毁，减少内存消耗，更高效渲染；
/// GridView.count构造函数是GrdiView使用SliverGridDelegateWithFixedCrossAxisCount的简写（语法糖），效果完全一致；
/// GridView.extent构造函数式GridView使用SliverGridDelegateWithMaxCrossAxisExtent的简写（语法糖），效果完全一致。

/// padding：表示内边距
/// crossAxisCount：表示每行显示的网格个数
/// crossAxisSpacing：表示每个网格之间的间距。
/// childAspectRatio: 表示宽高比，即宽是高的多少倍，0.75=3/4
/// mainAxisSpacing:可以理解为行间距
/// crossAxisSpacing:可以理解为列间距


class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewPageState();
  }
}

class _GridViewPageState extends State<GridViewPage> {
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
          title: Text("GridView"),
        ),
//        body: buildGridView(),
        body: buildGridViewForBuilder(),
//        body: buildGridViewForCount(),
//        body: buildGridViewForExtent(),
    );
  }

  // 构造默认GridView
  Widget buildGridView() {
    Iterable<Widget> itemList =
        list.map<Widget>((String item) => buildItem(context, item));
    return GridView(
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: itemList.toList(),
    );
  }

  // 构造默认GridView.builder
  Widget buildGridViewForBuilder() {
    return GridView.builder(
      itemCount: list.length,
      padding: EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return buildItem(context, list[index]);
      },
    );
  }

  // 构造默认GridView.count 完全等同于buildGridView
  Widget buildGridViewForCount() {
    Iterable<Widget> itemList =
    list.map<Widget>((String item) => buildItem(context, item));
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 10),
      shrinkWrap: true,
      crossAxisCount: 4,
      children: itemList.toList(),
    );
  }

  // 构造默认GridView.extent
  Widget buildGridViewForExtent() {
    Iterable<Widget> itemList =
    list.map<Widget>((String item) => buildItem(context, item));
    return GridView.extent(
      shrinkWrap: true,
      maxCrossAxisExtent: 200,
      children: itemList.toList(),
    );
  }

  // 构造item
  Widget buildItem(context, item) {
    return GestureDetector(
      child: CustomerItem(
        title: item,
      ),
      onTap: () {
        Fluttertoast.showToast(msg: item);
      },
    );
  }
}
