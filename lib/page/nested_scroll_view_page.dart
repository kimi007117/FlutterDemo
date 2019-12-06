import 'package:flutter/material.dart';

/// NestedScrollView 即 支持嵌套滑动的 ScrollView。
/// 我们可以简单的把 NestedScrollView 类比为 ScrollView，其作用就是作为控件父布局，从而具备（嵌套）滑动功能。
/// NestedScrollView 与 ScrollView 的区别就在于 NestedScrollView 支持嵌套滑动，无论是作为父控件还是子控件，嵌套滑动都支持，且默认开启。
/// 在一些需要支持嵌套滑动的情景中，比如一个 ScrollView 内部包裹一个 RecyclerView，那么就会产生滑动冲突，这个问题就需要你自己去解决。
/// 而如果使用 NestedScrollView 包裹 RecyclerView，嵌套滑动天然支持，你无需做什么就可以实现前面想要实现的功能了。
///
class NestedScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NestedScrollViewPageState();
}

class _NestedScrollViewPageState extends State<NestedScrollViewPage> with TickerProviderStateMixin{
  List<String> list = List();


  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      // Causes the app to rebuild with the new _selectedChoice.
      _selectedChoice = choice;
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
        title: Text("NestedScrollView"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: headerSliverBuilder,
              body : TabBarView(
                children: choices.map((Choice choice) {
                  return new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new ChoiceCard(choice: choice),
                  );
                }).toList(),
              ),
            )
        )
    );
  }

  List<Widget> headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {


    return <Widget>[
      SliverAppBar(
        //1.在标题左侧显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
        leading: Icon(_selectedChoice.icon),

        //2. ? 控制是否应该尝试暗示前导小部件为null
        automaticallyImplyLeading: true,

        //3.当前界面的标题文字
        title: Text(_selectedChoice.title),

        //4.一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
        //对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
        actions: <Widget>[
          new IconButton(
            // action button
            icon: new Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ),
          new IconButton(
            // action button
            icon: new Icon(choices[1].icon),
            onPressed: () {
              _select(choices[1]);
            },
          ),
          new PopupMenuButton<Choice>(
            // overflow menu
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return new PopupMenuItem<Choice>(
                  value: choice,
                  child: new Text(choice.title),
                );
              }).toList();
            },
          )
        ],

        //5.一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，
        // 可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image(
            image: NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551944816841&di=329f747e3f4c2554f24c609fd6f77c49&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F160610%2F9-160610114520.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        //6.一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
        bottom: new TabBar(
          isScrollable: true,
          tabs: choices.map((Choice choice) {
            return new Tab(
              text: choice.title,
              icon: new Icon(choice.icon),
            );
          }).toList(),
        ),

        //7.? 材料设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，
        // 当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
        elevation: 1,

        //APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
        backgroundColor: Colors.red,

        //App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
        brightness: Brightness.light,

        //App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData().primaryIconTheme
        iconTheme: ThemeData().primaryIconTheme,

        //App bar 上的文字主题。默认值为 ThemeData（）.primaryTextTheme
        textTheme: ThemeData().accentTextTheme,

        //此应用栏是否显示在屏幕顶部
        primary: true,

        //标题是否居中显示，默认值根据不同的操作系统，显示方式不一样,true居中 false居左
        centerTitle: true,

        //横轴上标题内容 周围的间距
        titleSpacing: NavigationToolbar.kMiddleSpacing,

        //展开高度
        expandedHeight: 200,

        //是否随着滑动隐藏标题
        floating: true,

        //tab 是否固定在顶部
        pinned: true,

        //与floating结合使用
        snap: true,
      )
    ];
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    Widget _itemBuilder(BuildContext context, int index) {
      return ListTile(
        leading: Icon(choice.icon),
        title: Text("this is a " + choice.title),
      );
    }

    return new Card(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: 30,
        ),
      ),
//          body: Center(
//            child: ListView.builder(
//                itemBuilder: _itemBuilder,
//                itemCount: 100,
//
//            ),
//          )),

//      child: new Center(
//        child: new Column(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            new Icon(choice.icon, size: 128.0, color: textStyle.color),
//            new Text(choice.title, style: textStyle),
//          ],
//        ),
//      ),
    );
  }
}
