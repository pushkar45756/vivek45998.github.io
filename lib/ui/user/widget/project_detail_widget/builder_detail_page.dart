// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
//import 'package:velocity_x/velocity_x.dart';


import 'package:web/model/remote_project_detail_model.dart';

import '../../../project/project_detail_page/project_detail_wideget_web/builder_detail.dart';

class ProjectDetailWidget extends StatelessWidget {
  ProjectDetailWidget({Key? key, this.projectList}) : super(key: key);
  ProjectDetailModel? projectList;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [

          SizedBox(
            height: height * 0.032,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                "Builder detail".toUpperCase(),
                style: TextStyle(
                    fontSize: height * 0.016, fontWeight: FontWeight.bold),
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
            height: height * 0.013,
          ),
          BuilderDetailPage(projectDetail:projectList)

         // ClientDetailPage(projectDetail:projectList)
        ],
      ),
    );
  }

}
