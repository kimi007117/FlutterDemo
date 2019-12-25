import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/should_rebuild_widget.dart';

class ShouldRebuildPage extends StatefulWidget {
  @override
  _ShouldRebuildPageState createState() => _ShouldRebuildPageState();
}

class _ShouldRebuildPageState extends State<ShouldRebuildPage> {
  int productNum = 0;
  int counter = 0;

  _incrementCounter() {
    setState(() {
      ++counter;
    });
  }

  _incrementProduct() {
    setState(() {
      ++productNum;
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
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        children: <Widget>[
          ShouldRebuild<Counter>(
            shouldRebuild: (oldWidget, newWidget) =>
                oldWidget.counter != newWidget.counter,
            child: Counter(
              counter: counter,
              onClick: _incrementCounter,
              title: '我是优化过的Counter',
            ),
          ),
          Counter(
            counter: counter,
            onClick: _incrementCounter,
            title: '我是未优化过的Counter',
          ),
          Text(
            'productNum = $productNum',
            style: TextStyle(fontSize: 22, color: Colors.deepOrange),
          ),
          RaisedButton(
            onPressed: _incrementProduct,
            child: Text('increment Product'),
          )
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final VoidCallback onClick;
  final int counter;
  final String title;

  Counter({this.counter, this.onClick, this.title});

  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: color,
      height: 150,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'counter = ${this.counter}',
                style: TextStyle(fontSize: 43, color: Colors.white),
              ),
            ],
          ),
          RaisedButton(
            color: color,
            textColor: Colors.white,
            elevation: 20,
            onPressed: onClick,
            child: Text('increment Counter'),
          ),
        ],
      ),
    );
  }
}
