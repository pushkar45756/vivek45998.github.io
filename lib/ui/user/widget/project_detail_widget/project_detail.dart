// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/extention_function.dart';
import 'package:web/model/project_list_model.dart';
import 'package:web/model/remote_project_detail_model.dart';

class ProjectDet extends StatelessWidget {
  ProjectDet({Key? key,this.projectList}) : super(key: key);
ProjectDetailModel? projectList;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [

          SizedBox(
            height: height * 0.02,
          ),

          Padding(
            padding:
            EdgeInsets.only(left: height * 0.0016, right: height * 0.0016),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.03,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project name",
                          style: TextStyle(
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Text(
                          projectList?.name
                              .toString()
                              .capitalize() ??
                              '',
                          style: TextStyle(
                              fontSize: height * 0.013,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Text(
                          projectList?.description
                              .toString()
                              .capitalize() ??
                              '',
                          style: TextStyle(
                              fontSize: height * 0.013,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Created At:",
                          style: TextStyle(
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Text(
                          projectList?.createdDate
                              .toString()
                              ??
                              '',
                          style: TextStyle(
                              fontSize: height * 0.013,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(height * 0.008),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last update",
                          style: TextStyle(
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Text(
                          projectList?.lastUpdated
                              .toString()
                              .capitalize() ??
                              '',
                          style: TextStyle(
                              fontSize: height * 0.013,
                              fontWeight: FontWeight.w200),
                        ),

                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                         "Status",
                          style: TextStyle(
                              fontSize: height * 0.014,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: height * 0.002,
                        ),
                        Text(
                            projectList?.status
                                .toString()
                                .capitalize() ??
                                '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: height * 0.013,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

          // ClientDetailPage(projectDetail:projectList)
        ],
      ),
    );
  }
}
