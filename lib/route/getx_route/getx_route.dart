import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web/local_storage.dart';
import 'package:web/login_page.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/admin_dashboard.dart';

import '../../ui/dashboard.dart';
import '../../ui/project/project.dart';
import '../../ui/user/user_detail_page.dart';
import '../../ui/user/user_detail_responsive/layout_builder.dart';
import '../../ui/user/user_list.dart';


class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
      name: RouterUrlName.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
        name: RouterUrlName.samplePage,
        page: () => const SamplePage(),
         middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.dashboard,
        page: () => const DashboardPage(),
         middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.projectPage,
        page: () => const ProjectPage(),
         middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.userPage,
        page: () => const UserPage(),
         middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.userDetail,
        page: () => UserDetail(),
         middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.layoutPage,
        page: () => LayoutPage(),
        middlewares: [RouteMiddleWare()])
  ];
}

class RouteMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var loginToken= LocalStorage.getData(LocalStorage.loginBearerToken);
    return loginToken != null
        ? null //const RouteSettings(name:RouterUrlName.samplePage)
        : const RouteSettings(name: RouterUrlName.loginPage);
  }
}
