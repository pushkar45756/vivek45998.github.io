import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/nav2/get_nav_config.dart';
import 'package:get/get_navigation/src/nav2/get_router_delegate.dart';
import 'package:web/route/router_url_name.dart';

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(RouterUrlName.loginPage)!.currentPage!],
    );
  }
}