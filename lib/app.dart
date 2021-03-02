import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/global.dart';
import 'config.dart';

class MyApp extends StatelessWidget {
  final Color color;

  MyApp(this.color);

  final PageRouteFactory _pageRouteBuilder =
      <T>(RouteSettings settings, WidgetBuilder builder) {
    final Function pageContentBuilder = pages[settings.name];
    if (settings.arguments != null) {
      return CupertinoPageRoute(
          settings: settings,
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
    }
    return CupertinoPageRoute(
        settings: settings, builder: (context) => pageContentBuilder(context));
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      allowFontScaling: false,
      builder: () => WidgetsApp(
        color: this.color,
        routes: pages,
        pageRouteBuilder: _pageRouteBuilder,
        navigatorObservers: [GLObserver()],
      ),
    );
  }
}
