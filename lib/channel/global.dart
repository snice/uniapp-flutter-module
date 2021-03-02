import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screen_util.dart';

class GlobalChannel {
  MethodChannel _channel;
  BuildContext _context;
  Map<String, Function(Map<String, dynamic> map)> _methodHandlers = new Map();
  bool isInit = false;
  double _sh = 0;

  double get statusBarHeight {
    var su = ScreenUtil();
    if (su != null && su.statusBarHeight > 0) {
      return su.statusBarHeight;
    } else {
      if (_sh > 0) return _sh;
      return 30;
    }
  }

  void initChannel() {
    if (isInit) return;
    isInit = true;
    _channel = MethodChannel('com.itfenbao.uniapp');
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "canPop") {
        _channel.invokeMethod("canPop", Navigator.canPop(_context));
      } else {
        if (_methodHandlers.containsKey(call.method)) {
          if (call.arguments != null) {
            Function.apply(_methodHandlers[call.method],
                [new Map<String, dynamic>.from(call.arguments)]);
          } else {
            Function.apply(_methodHandlers[call.method], []);
          }
        } else {
          throw Exception('not implemented ${call.method}');
        }
      }
    });
  }

  void setContext(BuildContext context) {
    _context = context;
    _sh = MediaQuery.of(context).padding.top;
  }

  BuildContext getContext() {
    return _context;
  }

  void push(Route route) {
    Navigator.push(_context, route);
    this.fireEvent("canPop", true);
  }

  void pushNamed(String routeName) {
    Navigator.pushNamed(_context, routeName);
  }

  bool canPop() {
    return Navigator.canPop(_context);
  }

  void pop() {
    if (canPop()) {
      Navigator.maybePop(_context);
      Future.delayed(const Duration(milliseconds: 10), () {
        this.fireEvent("canPop", Navigator.canPop(_context));
      });
    } else {
      fireEvent("pop");
    }
  }

  void $on(String method, Function(Map<String, dynamic> map) handler) {
    _methodHandlers[method] = handler;
  }

  void $off(String method) {
    _methodHandlers.remove(method);
  }

  ///
  /// 调用uniapp回调
  ///
  void callUniCallback(String callbackId, [dynamic arguments]) {
    var params = new Map<String, dynamic>.from(arguments);
    params["callbackId"] = callbackId;
    fireEvent('_uni_callback', params);
  }

  ///
  /// 调用uniapp回调（持久回调）
  ///
  void callKeepAliveUniCallback(String callbackId, [dynamic arguments]) {
    var params = new Map<String, dynamic>.from(arguments);
    params["callbackId"] = callbackId;
    params["keepAlive"] = true;
    fireEvent('_uni_callback', params);
  }

  ///
  /// 调用uniapp方法
  ///
  void callUniMethod(String eventName, [dynamic arguments]) {
    fireEvent(eventName, arguments);
  }

  ///
  /// 调用uniapp方法（带回调）
  ///
  Future callUniMethodWithCallback(String eventName, [dynamic arguments]) {
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    int strlenght = 25;

    /// 生成的字符串固定长度
    String left = "";
    for (var i = 0; i < strlenght; i++) {
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    var params = new Map<String, dynamic>.from(arguments);
    params["callbackId"] = eventName + "&" + left;
    return fireEvent(eventName, params);
  }

  Future fireEvent(String eventName, [dynamic arguments]) {
    if (isInit) {
      return _channel.invokeMethod(eventName, arguments);
    }
    return Future.value("");
  }
}
