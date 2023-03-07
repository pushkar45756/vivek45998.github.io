import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/route/test_router/route_name.dart';

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),

      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.loginPage)!.currentPage!],
    );
  }
}
