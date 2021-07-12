import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_module/common/global.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../uniapp/app_bar.dart';

class SecondRoute extends StatefulWidget {
  final Map<String, dynamic> params;
  SecondRoute({required this.params});
  @override
  SecondRouteState createState() => SecondRouteState();
}

class SecondRouteState extends State<SecondRoute> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          UniAppBar(
            title: "Flutter Page2",
          ),
          Text(
            '参数:${widget.params}\n$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextButton(
            onPressed: _incrementCounter,
            child: Text('Add'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go backdd!'),
          ),
          Expanded(
            child: InAppWebView(
              key: GlobalKey(),
              initialUrlRequest:
                  URLRequest(url: Uri.parse('https://m.baidu.com')),
            ),
          ),
        ],
      )),
    );
  }
}
