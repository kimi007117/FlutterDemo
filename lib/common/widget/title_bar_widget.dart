import 'package:flutter/material.dart';

/// 招聘助手TitleBar样式
class TitleBarWidget extends StatelessWidget {
  final String title;

  // 默认直接返回，如果返回需要特殊处理的请在回调方法中处理
  final VoidCallback onBackPressed;

  TitleBarWidget({this.title, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Image(image: AssetImage('images/icon_back_arrow.png')),
            onPressed: () {
              if (onBackPressed != null) {
                // 在回调中处理
                onBackPressed();
              } else {
                // 直接返回
                print('home app bar');
                Navigator.maybePop(context);
              }
            },
          ),
          Visibility(
            visible: (title == null || title.length == 0) ? false : true,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, right: 0, bottom: 10),
              child: Text(
                title == null ? "" : title,
                style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
