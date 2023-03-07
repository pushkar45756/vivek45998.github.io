import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/model/remote_project_list_model.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/values/app_colors.dart';

class ProjectItem extends StatelessWidget {
  ProjectItem({Key? key, this.projectDetail}) : super(key: key);
  ProjectModel? projectDetail;
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: height * 0.016, right: height * 0.016),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            context.vxNav.push(Uri.parse(RouterUrlName.projectLayoutPage),
                params: projectDetail);
            //  Get.rootDelegate.toNamed(RouterUrlName.projectLayoutPage);
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
                  projectDetail?.name![0].toUpperCase() ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Sk-modernist",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            title: Text(
              projectDetail?.name.toString().capitalizeFirst ?? "",
              style: TextStyle(
                fontSize: height * 0.020,
                fontWeight: FontWeight.w600,
                color: AppColor.appBarColor,
              ),
            ),
            subtitle: Text(
              projectDetail?.description?.capitalizeFirst ?? "",
              style: TextStyle(
                  fontSize: height * 0.016,
                  fontWeight: FontWeight.w400,
                  color: AppColor.appBarColor),
            ),
            trailing: SizedBox(
              width: width * 0.08,
              child: progressButtonStyle(
                  text: projectDetail?.status == "in_progress"
                      ? "in progress".capitalizeFirst ?? ''
                      : projectDetail?.status?.capitalizeFirst ?? ''),
            ),
          ),
        ),
      ),
    );
  }

  progressButtonStyle({required String text, bool? isActive}) {
    return Container(
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
    );
  }
}
