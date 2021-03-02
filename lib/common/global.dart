import 'package:flutter/material.dart';
import '../channel/global.dart';

GlobalChannel globalChannel = GlobalChannel();

class GLObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    globalChannel.fireEvent("canPop", true);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    Future.delayed(const Duration(milliseconds: 10), () {
      var canPop = Navigator.canPop(globalChannel.getContext());
      globalChannel.fireEvent("canPop", canPop);
    });
  }
}
