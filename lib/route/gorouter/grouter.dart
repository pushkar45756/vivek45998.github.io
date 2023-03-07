// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';
// import 'package:web/ui/dashboard/dashboard.dart';
// import 'package:web/ui/user/user_detail_page.dart';
// import 'package:web/ui/user/user_list.dart';
// import 'package:web/local_storage.dart';
// import 'package:web/login_page.dart';
// import 'package:web/model/user_data.dart';
// import 'package:web/route/router_url_name.dart';
// import 'package:web/admin_dashboard.dart';
//
// class AppRoutes {
//
//   static final GoRouter routes = GoRouter(routes: <GoRoute>[
//     GoRoute(
//       path: RouterUrlName.loginPage,
//       builder: (BuildContext context, state) => LoginPage(),
//     ),
//     GoRoute(
//       path: RouterUrlName.dashboard,
//       builder: (_, state) => const DashboardPage(),
//       redirect: (context, state) => _redirect(context),
//     ),
//     GoRoute(
//       path:RouterUrlName.userPage,
//       builder: (_, state) => const UserPage(),
//       redirect: (context, state) => _redirect(context),
//     ),
//     GoRoute(
//       path: RouterUrlName.samplePage,
//       name: "samplePage",
//       builder: (_, state) => const SamplePage(),
//       redirect: (context, state) => _redirect(context),
//     ),
//     GoRoute(
//       path: RouterUrlName.userDetail,
//       name: "detailPage",
//       builder: (_, state) {
//         UserData ?data=state.extra as UserData?;
//         return UserDetail(user: data,);
//
//     },
//       redirect: (context, state) => _redirect(context),
//     ),
//   ]);
//
//   static String? _redirect(BuildContext context) {
//     if (LocalStorage.getData(LocalStorage.email) != null) {
//       print("object");
//       return null;
//     } else {
//       print("jkk");
//       context.namedLocation(RouterUrlName.loginPage);
//     }
//   }
// }
