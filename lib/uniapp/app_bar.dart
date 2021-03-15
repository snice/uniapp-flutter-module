import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/global.dart';

class UniAppBar extends StatelessWidget {
  // const UniAppBar({
  //   key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      // height: globalChannel.statusBarHeight + 46,
      child: Column(
        children: <Widget>[
          Container(
            height: uniapp.statusBarHeight,
          ),
          Container(
            height: 46,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 40,
                    child: Icon(
                      CupertinoIcons.back,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    uniapp.pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
