import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //注意：加入了child，AppBar的高度会是Container的实际高度，而不是你指定的高度
  final double height = 500; // 占位使用，没有实际用处，真实的高度是child的高度
  final Widget child; //从外部指定内容
  final Color backgroundColor; //设置bar的背景颜色

  CustomAppBar({this.child, this.backgroundColor});

  @override
  State<StatefulWidget> createState() {
    return _CustomAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: new SafeArea(
        top: true,
        child: widget.child,
      ),
    );
  }
}
