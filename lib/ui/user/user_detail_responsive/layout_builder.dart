// ignore_for_file: must_be_immutable

import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/model/user_data_list.dart';
import 'package:web/ui/user/user_detail_responsive/response_layout.dart';
import '../../../local_storage.dart';
import '../../../route/router_url_name.dart';
import '../mobile_and_web_layout_design/mobile_design.dart';
import '../mobile_and_web_layout_design/web_dsign.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key? key, this.user}) : super(key: key);
  UserList? user;

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  UserList? user;


  @override
  initState() {
    // TODO: implement initState

    print('++++++++++++++++++++++++++++++++++++++++++++++++++++');
    super.initState();
    html.window.onBeforeUnload.listen((event) async {
      print('Reloaded${event.type}===');
      LocalStorage.saveData(LocalStorage.isRefresh, false);
      await context.vxNav.push(
        Uri.parse(RouterUrlName.layoutPage),
      );
      print('Reloaded2');
    });

    if (widget.user != null) {
      LocalStorage.saveData(LocalStorage.user, widget.user);
      LocalStorage.saveData(LocalStorage.isRefresh, true);
    } else {
      //LocalStorage.saveData(LocalStorage.isRefresh, false);
    }
    userData();
    //print(user?.email);
  }

  userData() async {
    var data = LocalStorage.getData(LocalStorage.user);
    bool isRefresh = LocalStorage.getData(LocalStorage.isRefresh);
    //final u=jsonDecode(data);
    //  user=data;
    //  print("is=$isRefresh");
    // user = data;
    if (isRefresh == true) {
      user = data;
      // LocalStorage.
    } else {
      var y = UserList.fromJson(data);
      user = y;
    }
    setState(() {
      // user=
    });

  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      // onWillPop: () async {
      //   print('Backbutton pressed (device or appbar button), do whatever you want.');
      //
      //   //trigger leaving and use own data
      //   Navigator.pop(context, false);
      //
      //   //we need to return a future
      //   return Future.value(false);
      // },
      child: Scaffold(

        backgroundColor: Colors.cyanAccent.withOpacity(0.4),
        body: ResponsiveLayoutPage(
          mobileBody: MobileLayout(user: user),
          desktopBody: DesktopPage(user: user),
        ),
      ),
    );
  }
}
