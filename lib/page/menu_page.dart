import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/popup_window.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
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
        buildDropdownButton(),
        buildPopupMenuButton(),
      ],
    );
  }

  Widget buildPopupMenuButton() {
    return PopupMenuButton(
//              icon: Icon(Icons.home),
      child: Text("abc"),
      tooltip: "长按提示",
      initialValue: "hot",
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            child: Text("热度"),
            value: "hot",
          ),
          PopupMenuItem<String>(
            child: Text("最新"),
            value: "new",
          ),
        ];
      },
      onSelected: (String action) {
        switch (action) {
          case "hot":
            print("热度");
            break;
          case "new":
            print("最新");
            break;
        }
      },
      onCanceled: () {
        print("onCanceled");
      },
    );
  }

  String dropdown1Value = 'Free';
  String dropdown2Value;
  String dropdown3Value = 'Four';

  Widget buildDropdownButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text('Simple dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown1Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown1Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Dropdown with a hint:'),
            trailing: DropdownButton<String>(
              value: dropdown2Value,
              hint: const Text('Choose'),
              onChanged: (String newValue) {
                setState(() {
                  dropdown2Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          DropdownButton<String>(
            value: dropdown3Value,
            onChanged: (String newValue) {
              setState(() {
                dropdown3Value = newValue;
              });
            },
            items: <String>[
              'One',
              'Two',
              'Free',
              'Four',
              'Can',
              'I',
              'Have',
              'A',
              'Little',
              'Bit',
              'More',
              'Five',
              'Six',
              'Seven',
              'Eight',
              'Nine',
              'Ten',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
