import 'package:flutter/material.dart';
import '../common/global.dart';
import 'app_icon.dart';

class UniAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color styleColor;
  final String title;
  final double contentHeight;

  double get toolbarHeight => contentHeight ?? 46;

  UniAppBar({@required this.title, this.styleColor, this.contentHeight})
      : super();

  @override
  Size get preferredSize {
    return Size.fromHeight(uniapp.statusBarHeight + toolbarHeight);
  }

  @override
  State<StatefulWidget> createState() => _AppBarState();
}

class _AppBarState extends State<UniAppBar> {
  var backBtn = GestureDetector(
    child: Container(
      width: 40,
      height: 44,
      child: UniAppIcon.back,
    ),
    onTap: () {
      uniapp.pop();
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: uniapp.statusBarHeight,
            ),
            Container(
                height: widget.toolbarHeight,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      child: new Container(
                        child: backBtn,
                      ),
                    ),
                    new Container(
                      child: new Text(widget.title,
                          style: new TextStyle(
                              fontSize: 18,
                              color: widget.styleColor ?? Colors.white)),
                    ),
                  ],
                ))
          ],
        ));
  }
}
