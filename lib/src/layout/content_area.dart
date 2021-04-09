import 'package:flutter/material.dart';
import 'package:macos_ui/src/layout/scaffold.dart';

class ContentArea extends StatelessWidget {
  const ContentArea({
    Key? key,
    @required this.builder,
  }) : super(key: key);

  final ScrollableWidgetBuilder? builder;

  static final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScaffoldConstraints.of(context).remainingWidth,
      child: Scrollbar(
        controller: _scrollController,
        child: builder!(context, _scrollController),
      ),
    );
  }
}
