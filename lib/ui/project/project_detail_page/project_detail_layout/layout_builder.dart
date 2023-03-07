// ignore_for_file: must_be_immutable
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web/model/project_list_model.dart';
import 'package:web/model/remote_project_list_model.dart';
import 'package:web/ui/project/project_detail_page/project_detail_layout/responsive_layout.dart';
import '../../../../local_storage.dart';
import '../../../../route/router_url_name.dart';
import '../mobile_and_web_design/desktop_page.dart';
import '../mobile_and_web_design/mobile_page.dart';

class ProjectLayoutBuilder extends StatefulWidget {
  ProjectLayoutBuilder({Key? key, this.projectList}) : super(key: key);
  ProjectModel? projectList;

  @override
  State<ProjectLayoutBuilder> createState() => _ProjectLayoutBuilderState();
}

class _ProjectLayoutBuilderState extends State<ProjectLayoutBuilder> {
  ProjectModel? projectList;
  bool isLoading = true;

  showLoader(value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    html.window.onBeforeUnload.listen((event) async {
      LocalStorage.saveData(LocalStorage.isRefresh, false);
      await context.vxNav.push(
        Uri.parse(RouterUrlName.projectLayoutPage),
      );
    });
    if (widget.projectList != null) {
      LocalStorage.saveData(LocalStorage.projectData, widget.projectList);
      LocalStorage.saveData(LocalStorage.isRefresh, true);
    }
    projectData();
  }

  projectData() async {
    var data = LocalStorage.getData(LocalStorage.projectData);
    bool isRefresh = LocalStorage.getData(LocalStorage.isRefresh);

    if (isRefresh == true) {
      projectList = data;
    } else {
      var y = ProjectModel.fromJson(data);
      projectList = y;
    }
    setState(() {
      // user=
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent.withOpacity(0.4),
      body: ProjectResponsiveLayout(
        mobileBody: ProjectMobilePage(projectDetail: projectList,isMobile:true),
        desktopBody: ProjectDesktopPage(projectDetail: projectList),
      ),
    );
  }
}
