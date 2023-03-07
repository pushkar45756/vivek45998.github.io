import 'package:get/get.dart';
import 'package:web/model/user_data.dart';
import '../../login_page.dart';
import '../../admin_dashboard.dart';
import '../../ui/dashboard.dart';
import '../../ui/project/project.dart';
import '../../ui/user/user_detail_page.dart';
import '../../ui/user/user_detail_responsive/layout_builder.dart';
import '../../ui/user/user_list.dart';
import '../router_url_name.dart';

abstract class AppPages {
  // static final pages = [
  //   GetPage(
  //     name: Routes.HOME,
  //     page: () => Home(),
  //   ),
  //   GetPage(
  //     name: Routes.LOGIN,
  //     page: () => Login(),
  //   ),
  //   GetPage(
  //     name: Routes.SIGNUP,
  //     page: () => Signup(),
  //   ),
  // ];
  UserData?userData;
  static final routes = [
    GetPage(
      name: RouterUrlName.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
        name: RouterUrlName.samplePage,
        page: () => const SamplePage(),
      //  middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.dashboard,
        page: () => const DashboardPage(),
      //  middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.projectPage,
        page: () => const ProjectPage(),
      //  middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.userPage,
        page: () => const UserPage(),
       // middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.userDetail,
        page: () => UserDetail(),
    //    middlewares: [RouteMiddleWare()]
    ),
    GetPage(
        name: RouterUrlName.layoutPage,
        page: () => LayoutPage(user: null,),
       // middlewares: [RouteMiddleWare()]
  )
  ];


}