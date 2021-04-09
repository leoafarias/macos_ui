import 'package:macos_ui/macos_ui.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return MacosApp(
          title: 'macos_ui example',
          style: Style(
            brightness: Brightness.light,
            accentColor: CupertinoColors.systemIndigo,
            resizerColor: CupertinoColors.systemGrey4.color,
          ),
          darkStyle: Style(
            brightness: Brightness.dark,
            accentColor: CupertinoColors.systemIndigo,
            resizerColor: CupertinoColors
                .black,
          ),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false, //yay!
          home: Demo(),
        );
      },
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      titleBar: TitleBar(
        size: TitleBarSize.small,
        child: Text('Example'),
      ),
      sidebar: Sidebar(
        minWidth: 200,
        builder: (context, scrollController) {
          return ListView.builder(
            controller: scrollController,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: CupertinoColors.systemGrey,
                  alignment: Alignment.center,
                  child: Text('$index'),
                ),
              );
            },
          );
        },
      ),
      children: [
        ResizablePane(
          minWidth: 200,
          resizeDirection: ResizeDirection.right,
          builder: (context, scrollController) {
            return Center();
          },
        ),
        ContentArea(
          builder: (context, scrollController) {
            return Center(
              child: Container(
                height: 50.0,
                width: 50.0,
                color: context.style.accentColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
