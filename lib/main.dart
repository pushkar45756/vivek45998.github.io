import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/admin_dashboard.dart';
//import 'package:velocity_x/velocity_x.dart';

import 'package:web/local_storage.dart';
import 'package:web/localstorage_sessionstorage/localstorage.dart';
import 'package:web/localstorage_sessionstorage/sessionstorage.dart';
import 'package:web/login_page.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/ui/project/project.dart';
import 'package:web/ui/project/project_detail_page/project_detail_layout/layout_builder.dart';
import 'package:web/ui/user/user_detail_page.dart';
import 'package:web/ui/user/user_detail_responsive/layout_builder.dart';

// @JS()
// library onBeforeUnload;
//
// import 'package:js/js.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  print("====${SessionStorage.getValue(LocalStorage.loginBearerToken)}");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var dat = LocalStorage.getData(LocalStorage.loginBearerToken);
  var isLoggedIn =
      SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
          LocalStorageWindow.getValue(LocalStorage.loginBearerToken) != null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        notFoundPage: (uri, params) => MaterialPage(
          key: const ValueKey('Not-found-page'),
          child: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: Text('Invalid url ${uri.path} not found'),
              ),
            ),
          ),
        ),
        // observers: [MyObs()],
        routes: {
          "/": (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? const MaterialPage(
                      child: SamplePage(),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.layoutPage: (_, param) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? MaterialPage(
                      child: LayoutPage(
                        user: param,
                      ),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.samplePage: (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? const MaterialPage(
                      child: SamplePage(),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.projectPage: (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? const MaterialPage(child: ProjectPage())
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.userDetail: (_, __) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? MaterialPage(
                      child: UserDetail(),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
          RouterUrlName.projectLayoutPage: (_, params) =>
              SessionStorage.getValue(LocalStorage.loginBearerToken) != null ||
                      LocalStorageWindow.getValue(
                              LocalStorage.loginBearerToken) !=
                          null
                  ? MaterialPage(
                      child: ProjectLayoutBuilder(
                        projectList: params,
                      ),
                    )
                  : const MaterialPage(
                      child: LoginPage(),
                    ),
        },
      ),
    );
  }
}

// @JS('onbeforeunload')
// external set _onBeforeUnload(String Function(dynamic) callback);
//
// void onBeforeUnload(String Function() callback) {
//   _onBeforeUnload = allowInterop((_) => callback());
// }
