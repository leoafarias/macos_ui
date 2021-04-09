import 'dart:math' as math show max, min;

import 'package:flutter/rendering.dart' show SystemMouseCursors;
import 'package:macos_ui/src/layout/resizable_pane_notifier.dart';
import 'package:macos_ui/src/layout/scaffold.dart';

import '../../macos_ui.dart';

const EdgeInsets kSidebarSafeArea = EdgeInsets.only(top: 50);

/// Indicates the draggable side of the sidebar for resizing
enum ResizeDirection { left, right }

class ResizablePane extends StatefulWidget {
  ResizablePane({
    Key? key,
    required this.builder,
    this.decoration,
    this.maxWidth = 500.0,
    required this.minWidth,
    this.isResizable = true,
    required this.resizeDirection,
    this.scaffoldBreakpoint = 500,
  })  : assert(maxWidth! >= minWidth),
        super(key: key);

  final ScrollableWidgetBuilder builder;
  final BoxDecoration? decoration;
  final bool? isResizable;
  final double? maxWidth;
  final double minWidth;
  final ResizeDirection resizeDirection;
  final double? scaffoldBreakpoint;

  @override
  ResizablePaneState createState() => ResizablePaneState();
}

class ResizablePaneState extends State<ResizablePane> {
  final _key = UniqueKey();
  final _scrollController = ScrollController();
  late double _width;

  ScaffoldConstraints get _scaffoldConstraints =>
      ScaffoldConstraints.of(context);

  ResizablePaneNotifier get _notifier => _scaffoldConstraints.valueNotifier;

  BoxConstraints get _constraints => _scaffoldConstraints.constraints;

  double? get _maxWidth => _constraints.maxWidth;

  double? get _maxHeight => _constraints.maxHeight;

  bool get _resizeOnRight => widget.resizeDirection == ResizeDirection.right;

  BoxDecoration get _decoration {
    final _borderSide = BorderSide(color: context.style.resizerColor!);
    final right = Border(right: _borderSide);
    final left = Border(left: _borderSide);
    return BoxDecoration(border: _resizeOnRight ? right : left).copyWith(
      color: widget.decoration?.color,
      border: widget.decoration?.border,
      borderRadius: widget.decoration?.borderRadius,
      boxShadow: widget.decoration?.boxShadow,
      backgroundBlendMode: widget.decoration?.backgroundBlendMode,
      gradient: widget.decoration?.gradient,
      image: widget.decoration?.image,
      shape: widget.decoration?.shape,
    );
  }

  Widget get _resizeArea {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragUpdate: (details) {
        setState(() {
          _width = math.max(
            widget.minWidth,
            math.min(
              math.min(widget.maxWidth ?? 0, _maxWidth!),
              _resizeOnRight
                  ? _width + details.delta.dx
                  : _width - details.delta.dx,
            ),
          );
          if (_width >= widget.minWidth && _width < widget.maxWidth!) {
            _notifier.update(_key, _width);
          }
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeColumn,
        child: Container(color: Color(0x00000000), width: 3),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _width = widget.minWidth;
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_notifier.value.containsKey(_key)) {
      _notifier.update(_key, _width, notify: false);
    }
    if (_maxWidth! <= widget.scaffoldBreakpoint!) return SizedBox.shrink();
    return SizedBox(
      width: _width,
      height: _maxHeight,
      child: DecoratedBox(
        decoration: _decoration,
        child: Stack(
          children: [
            Scrollbar(
              controller: _scrollController,
              child: widget.builder(context, _scrollController),
            ),
            if (widget.isResizable! && !_resizeOnRight)
              Positioned(
                left: 0,
                width: 3,
                height: _maxHeight,
                child: _resizeArea,
              ),
            if (widget.isResizable! && _resizeOnRight)
              Positioned(
                right: 0,
                width: 3,
                height: _maxHeight,
                child: _resizeArea,
              ),
          ],
        ),
      ),
    );
  }
}
