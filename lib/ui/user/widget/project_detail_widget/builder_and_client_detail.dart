// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:web/model/remote_project_detail_model.dart';
import 'package:web/ui/user/widget/project_detail_widget/project_detail.dart';

import 'builder_detail_page.dart';
import 'client_detail_widget.dart';


class ProjectAndClientDetail extends StatelessWidget {
  ProjectAndClientDetail({Key? key, this.projectList}) : super(key: key);
  ProjectDetailModel? projectList;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          ProjectDet(projectList:projectList),
          SizedBox(
            height: height * 0.02,
          ),
          ProjectDetailWidget(projectList: projectList,),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                "Client Detail".toUpperCase(),
                style: TextStyle(
                    fontSize: height * 0.019, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.012,
          ),
          Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              border: Border.all(width: 0.4),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ClientDetailPage(projectDetail: projectList,),
        ],
      ),
    );
  }
}
