import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/global.dart';

class UniAppBar extends StatelessWidget {
  // const UniAppBar({
  //   key,
  // }) : super(key: key);

  var backBtn = GestureDetector(
    child: Container(
      width: 44,
      height: 44,
      child: Icon(
        IconData(0xe601, fontFamily: 'streamiconfont'),
        size: 27,
        color: Colors.white,
      ),
    ),
    onTap: () {
      uniapp.pop();
    },
  );

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
            height: 46,
            child: Row(
              children: <Widget>[
                backBtn,
              ],
            ),
          )
        ],
      ),
    );
  }
}
