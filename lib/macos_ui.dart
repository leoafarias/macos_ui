library macos_ui;

export 'package:flutter/cupertino.dart'
    show CupertinoColors, CupertinoDynamicColor;
export 'package:flutter/material.dart'
    show
        Brightness,
        ThemeMode,
        Feedback,
        DefaultMaterialLocalizations,
        PageTransitionsBuilder,
        FlutterLogo,
        CircleAvatar,
        Divider,
        Scrollbar,
        MouseRegion,
        VerticalDivider;

/// todo: package-level docs
export 'package:flutter/widgets.dart' hide Icon, IconTheme, TextBox;

export 'src/layout/content_area.dart';
export 'src/layout/scaffold.dart';
export 'src/layout/resizable_pane.dart';
export 'src/layout/sidebar.dart';
export 'src/layout/title_bar.dart';
export 'src/macos_app.dart';
export 'src/styles/style.dart';
export 'src/styles/typography.dart';
export 'src/util.dart';
