import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/global.dart';
import '../uniapp/app_bar.dart';
import '../common/root_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends RootPageState<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    var value = await globalChannel
        .callUniMethodWithCallback('test', {'test': _counter});
    print(value);
  }

  @override
  void initState() {
    super.initState();
    globalChannel.$on('test', (Map<String, dynamic> map) {
      print('test:' + map.toString());
      if (map.containsKey("callbackId")) {
        globalChannel.callUniCallback(map['callbackId'], {'a': 6});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    globalChannel.$off('test');
  }

  @override
  void initParams(Map<String, dynamic> params) {
    if (params != null) {
      print(params);
    }
  }

  @override
  Widget render(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          UniAppBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextButton(
                  onPressed: _incrementCounter,
                  child: Text('Add'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/second",
                        arguments: {'id': 1});
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
