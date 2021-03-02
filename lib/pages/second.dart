import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../uniapp/app_bar.dart';

class SecondRoute extends StatefulWidget {
  final Map<String, dynamic> params;
  SecondRoute({this.params});
  @override
  SecondRouteState createState() => SecondRouteState(params: params);
}

class SecondRouteState extends State<SecondRoute> {
  final Map<String, dynamic> params;
  int _counter = 0;
  SecondRouteState({this.params});

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
          UniAppBar(),
          Text(
            'id:$params,$_counter',
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
            child: Text('Go back!'),
          )
        ],
      )),
    );
  }
}
