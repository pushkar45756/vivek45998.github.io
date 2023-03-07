import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class MyObs extends VxObserver {
  @override
  void didChangeRoute(Uri route, Page page, String pushOrPop) {
    print("a routes ${route.path} - $pushOrPop  ${page.name}");
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('Pushed a routes ${previousRoute?.navigator?.restorationId}===${route.settings.arguments}');
  }
  @override
  void push(Route route, Route? previousRoute){
    print('Popped a route,${route.settings.name}   ${previousRoute?.settings.name}');
  }
  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped a route,${route.settings.name}   ${previousRoute?.settings.name}');
  }
}