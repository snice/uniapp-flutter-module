import 'package:flutter/material.dart';
import 'global.dart';

abstract class RootPageState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  var isInitP = false;
  Widget render(BuildContext context);

  void initParams(Map<String, dynamic> params);

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    uniapp.initChannel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (!isInitP) {
        isInitP = true;
        getParams();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    uniapp.setContext(context);
    return render(context);
  }

  getParams() async {
    var map = await uniapp.fireEvent("getParams");
    initParams(new Map<String, dynamic>.from(map));
  }
}
