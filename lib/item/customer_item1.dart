import 'package:flutter/material.dart';

class CustomerItem extends StatefulWidget {

  final String title;

  CustomerItem({this.title});

  @override
  State<StatefulWidget> createState() {
    return _CustomerItemState();
  }
}

class _CustomerItemState extends State<CustomerItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
          decoration: new BoxDecoration(
            color: Colors.yellow,
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
          ),
        ),
        Divider(
          height: 0.5,
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
          color: Color(0xFFE6E6E6),
        ),
      ],
    );
  }
}
