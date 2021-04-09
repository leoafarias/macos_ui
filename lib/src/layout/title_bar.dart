import 'package:flutter/widgets.dart';

enum TitleBarSize { large, small }

class TitleBar {
  TitleBar({
    this.alignment,
    this.child,
    this.padding,
    this.decoration,
    this.size = TitleBarSize.large,
  });

  final Alignment? alignment;
  final Widget? child;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final TitleBarSize? size;
}