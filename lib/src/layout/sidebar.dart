import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

class Sidebar {
  Sidebar({
    required this.builder,
    required this.minWidth,
    this.key,
    this.decoration,
    this.resizerColor,
    this.isResizable = true,
    this.maxWidth = 400.0,
    this.padding,
  });

  final ScrollableWidgetBuilder builder;
  final Decoration? decoration;
  final bool? isResizable;
  final Key? key;
  final double? maxWidth;
  final double minWidth;
  final EdgeInsets? padding;
  final Color? resizerColor;
}
