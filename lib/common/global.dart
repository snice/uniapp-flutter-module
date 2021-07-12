import 'package:flutter/material.dart';
import '../channel/uniapp.dart';

UniappMethodChannel uniapp = UniappMethodChannel();

class GLObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    uniapp.fireEvent("canPop", true);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    Future.delayed(const Duration(milliseconds: 10), () {
      var canPop = Navigator.canPop(uniapp.getContext());
      uniapp.fireEvent("canPop", canPop);
    });
  }
}
