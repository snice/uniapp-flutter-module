import 'package:flutter/material.dart';
import 'pages/index.dart';
import 'pages/second.dart';

Map<String, WidgetBuilder> pages = {
  "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
  "/second": (context, {arguments}) => SecondRoute(params: arguments)
};
