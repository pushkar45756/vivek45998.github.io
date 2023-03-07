// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/utiils/utils.page.dart';
import 'package:web/values/app_colors.dart';
import 'package:web/values/app_strings.dart';

import '../../model/user_data_list.dart';

class UserItem extends StatefulWidget {
  UserItem({Key? key, this.user}) : super(key: key);
  UserList? user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  double height = 0;
  double width = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: EdgeInsets.only(left: height * 0.016, right: height * 0.016),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            // context.vxNav.push(
            //     Uri(path: RouterUrlName.layoutPage,
            //         queryParameters: {"id": widget.user?.id.toString()}),);
            context.vxNav
                .push(Uri.parse(RouterUrlName.layoutPage), params: widget.user);
            // Get.rootDelegate.toNamed(RouterUrlName.userDetail,);
          },
          child: ListTile(
              leading: Container(
                width: width * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.appBarColor,
                ),
                child: Center(
                  child: Text(
                    widget.user?.firstName![0].toUpperCase() ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Sk-modernist",
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              title: Text(
                widget.user?.firstName
                    .toString()
                    .capitalizeFirst ?? "",
                style: TextStyle(
                  fontSize: height * 0.020,
                  fontWeight: FontWeight.w600,
                  color: AppColor.appBarColor,
                ),
              ),
              subtitle: Text(
                widget.user?.email ?? "",
                style: TextStyle(
                    fontSize: height * 0.016,
                    fontWeight: FontWeight.w400,
                    color: AppColor.appBarColor),
              ),
              trailing: SizedBox(
                width: width * 0.08,
                child: buttonStyle(
                    text: widget.user!.isActive == false
                        ? AppStrings.enable?.capitalizeFirst ?? ''
                        : AppStrings.disable
                      ..capitalizeFirst,
                    onClick: () async {
                      await Utils.showMyDialog(
                          context, widget.user!.isActive == false
                          ? AppStrings.enable?.capitalizeFirst ?? ''
                          : AppStrings.disable
                        ..capitalizeFirst,
                          subTitle: widget.user!.isActive == false
                              ? "Are you sure want to activate this account?" ??
                              ''
                              : "Are you sure want to deactivate this account?");
                      print("please click");
                    },
                    isActive: widget.user!.isActive),
              )
            /* Row(
                children: [
                  Expanded(
                    child: buttonStyle(
                        text: AppStrings.enable..capitalizeFirst,
                        onClick: () {}),
                  ),
                  Expanded(
                      child: buttonStyle(
                          text: AppStrings.disable..capitalizeFirst,
                          onClick: () {}))
                ],
              ),*/

          ),
        ),
      ),
    );
  }

  buttonActiveAndDeactive() {}

  buttonStyle({required String text, onClick, bool? isActive}) {
    return InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Container(
            height: width * 0.009,
            width: width * 0.009,
            decoration: BoxDecoration(
              color: isActive == false ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(width * 0.02),
              // border: Border.all(width: 1, color: AppColor.appBarColor),
            ),
          ),
          SizedBox(
            width: width * 0.006,
          ),
          Container(
            height: 32,
            width: width * 0.06,
            decoration: BoxDecoration(
              color: AppColor.appBarColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.01),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
