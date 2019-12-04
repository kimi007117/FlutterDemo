import 'package:flutter/material.dart';
import 'package:flutter_app/common/log/logger.dart';
import 'package:flutter_app/common/widget/children_delegate.dart';
import 'package:flutter_app/item/customer_item1.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 在构建ListView时有4中选择：
/// 利用显示的自列表来构造List<Widget>。此构造函数适合于具有少量子元素的列表视图，因为构造列表需要为可能显示在列表视图中的每个子元素执行工作，而不仅仅是那些实际可见的子元素。
/// ListView.builder利用IndexedWidgetBuilder来按需构造。这个构造函数适合于具有大量（或无限）子视图的列表视图，因为构建器只对那些实际可见的子视图调用。
/// 使用ListView.separated构造函数，采用两个IndexedWidgetBuilder：itemBuilder根据需要构建子项separatorBuilder类似地构建出现在子项之间的分隔符子项。此构造函数适用于具有固定数量的子控件的列表视图。
/// 使用ListView.custom的SliverChildDelegate构造，它提供了定制子模型的其他方面的能力。 例如，SliverChildDelegate可以控制用于估计实际上不可见的孩子的大小的算法。

/// 控制滚动的初始offset，可以通过设置ScrollController.initialScrollOffset属性。

/// 默认情况下，ListView将自动填充列表的可滚动的末端，以避免MediaQuery的填充所指示的部分阻塞。若要避免此行为，请重写可以空的padding属性。

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewPageState();
  }
}

class _ListViewPageState extends State<ListViewPage> {
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
        title: Text("ListView"),
      ),
//      body: buildListView(),
//      body: buildListViewForBuilder(),
//      body: buildListViewForSeparated(),
//      body: buildListViewForListTile(),
      body: buildListViewForCustom(),
    );
  }

  // 构造默认ListView
  Widget buildListView() {
    Iterable<Widget> itemList =
        list.map<Widget>((String item) => buildItem(context, item));
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: itemList.toList(),
    );
  }

  // 构造ListView.builder，无线列表考虑用这种方式，可以不需要itemCount
  Widget buildListViewForBuilder() {
    return ListView.builder(
      shrinkWrap: true,
//      scrollDirection: Axis.horizontal,  // horizontal时必须指定itemExtent
//      itemExtent: 160,
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return buildItem(context, list[index]);
      },
    );
  }

  // 构造ListView.separated
  Widget buildListViewForSeparated() {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return buildItem(context, list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        //和itemBuilder 同级别的执行
        return buildSeparatorItem(index);
      },
    );
  }

  // 构造ListView，ListTile 是Flutter 给我们准备好的widget 提供非常常见的构造和定义方式，包括文字，icon，点击事件，一般是能够满足基本需求，但是就不能自己定义了
  Widget buildListViewForListTile() {
    List<Widget> itemList = List();
    for (int i = 0; i < list.length; i++) {
      itemList.add(new Center(
        child: ListTile(
          leading: new Icon(Icons.list),
          title: new Text(list[i]),
          trailing: new Icon(Icons.keyboard_arrow_right),
        ),
      ));
    }
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: itemList,
    );
  }

  // 构造ListView.custom，无线列表考虑用这种方式，可以不需要itemCount
  Widget buildListViewForCustom() {
    return ListView.custom(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      childrenDelegate: MyChildrenDelegate((BuildContext context, int index) {
        return buildItem(context, list[index]);
      }, childCount: list.length),
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

  Widget buildSeparatorItem(int index) {
    if (index == 2) {
      return new Container(
        height: 40.0,
        child: new Center(
          child: new Text("类型1"),
        ),
        color: Colors.red,
      );
    } else if (index == 7) {
      return new Container(
        height: 40.0,
        child: new Center(
          child: new Text("类型2"),
        ),
        color: Colors.blue,
      );
    } else if (index == 14) {
      return new Container(
        height: 40.0,
        child: new Center(
          child: new Text("类型3"),
        ),
        color: Colors.pink,
      );
    } else {
      return new Container(height: 1.0, color: Colors.red);
    }
  }
}
