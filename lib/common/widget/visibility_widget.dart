import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum Visible {
  VISIBLE,
  INVISIBLE,
  GONE,
}

/// 一个自定义的显示与隐藏的Widget
class Visibility extends StatelessWidget {
  final Visible visible;
  final Widget child;

  Visibility({
    @required this.visible,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (visible == Visible.INVISIBLE) {
      return IgnorePointer(
          ignoring: true, child: Opacity(opacity: 0.0, child: child));
    } else if (visible == Visible.GONE) {
      return Offstage(offstage: true, child: child);
    }
    return child;
  }
}
