import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

//import 'package:velocity_x/velocity_x.dart';

import 'package:web/local_storage.dart';
import 'package:web/localstorage_sessionstorage/localstorage.dart';
import 'package:web/localstorage_sessionstorage/sessionstorage.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/ui/project/project.dart';
import 'package:web/ui/user/user_list.dart';
import 'package:web/values/app_colors.dart';
import 'package:web/values/app_strings.dart';
import 'dart:html' as html;

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  Widget _selectedScreen = const UserPage();

  currentScreen(item) {
    switch (item.route) {
      // case RouterUrlName.dashboard:
      //   setState(() {
      //     _selectedScreen = const DashboardPage();
      //   });
      // //  Navigator.pop(context);
      //   break;
      case RouterUrlName.projectPage:
        setState(() {
          _selectedScreen = const ProjectPage();
        });

        break;
      case RouterUrlName.userPage:
        setState(() {
          _selectedScreen = const UserPage();
        });

        break;
      case RouterUrlName.loginPage:
        LocalStorage.remove(LocalStorage.loginBearerToken);
        LocalStorageWindow.localStorage.remove(
          LocalStorage.loginBearerToken,
        );

        SessionStorage.sessionStorage.remove(
          LocalStorage.loginBearerToken,
        );
        setState(() {
          context.vxNav.clearAndPush(
            Uri.parse(RouterUrlName.loginPage),
          );
        });
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    html.window.location;
   //  BackButtonInterceptor.add(myInterceptor);

  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          title: Text(
            AppStrings.admin.toUpperCase(),
          ),
          actions: [
            // InkWell(
            //   onTap: () {
            //     LocalStorage.remove(LocalStorage.loginBearerToken);
            //     LocalStorageWindow.localStorage.remove(LocalStorage.loginBearerToken,);
            //
            //     SessionStorage.sessionStorage.remove(LocalStorage.loginBearerToken,);
            //     context.vxNav.clearAndPush(Uri.parse(RouterUrlName.loginPage));
            //   //  Get.rootDelegate.offNamed(RouterUrlName.loginPage);
            //   },
            //   child: const Icon(Icons.logout),
            // ),
          ],
        ),
        sideBar: SideBar(
          activeTextStyle: TextStyle(color: AppColor.appBarColor),
          textStyle: TextStyle(color: AppColor.appBarColor),
          items: [
            // AdminMenuItem(
            //   title: AppStrings.dashboard.toUpperCase(),
            //   route: RouterUrlName.dashboard,
            //   icon: Icons.dashboard,
            // ),
            AdminMenuItem(
              title: AppStrings.allUser.toUpperCase(),
              route: RouterUrlName.userPage,
              icon: Icons.person,
            ),
            AdminMenuItem(
              title: AppStrings.projectPage.toUpperCase(),
              route: RouterUrlName.projectPage,
              icon: Icons.file_present_outlined,
            ),

            AdminMenuItem(
              title: AppStrings.logout.toUpperCase(),
              route: RouterUrlName.loginPage,
              icon: Icons.logout,
            ),
          ],
          selectedRoute: RouterUrlName.samplePage,
          onSelected: (item) {
            currentScreen(item);
          },
        ),
        body: SingleChildScrollView(
          child: _selectedScreen,
        ),
      ),
    );
  }
}
