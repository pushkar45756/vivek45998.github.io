// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:web/extention_function.dart';
import 'package:web/model/project_list_model.dart';
import 'package:web/model/remote_project_detail_model.dart';

class ClientDetailPage extends StatelessWidget {
  ClientDetailPage({Key? key, this.projectDetail}) : super(key: key);
  ProjectDetailModel? projectDetail;

  @override
  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
   double width = MediaQuery.of(context).size.width;
    return  Padding(
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
            "First name",
            style: TextStyle(
                fontSize: height * 0.014,
                fontWeight: FontWeight.bold),
           ),
           SizedBox(
            height: height * 0.002,
           ),
           Text(
            projectDetail?.client?.firstName
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
            "Email",
            style: TextStyle(
                fontSize: height * 0.014,
                fontWeight: FontWeight.bold),
           ),
           SizedBox(
            height: height * 0.002,
           ),
           Text(
            projectDetail?.client?.email
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
            "Phone",
            style: TextStyle(
                fontSize: height * 0.014,
                fontWeight: FontWeight.bold),
           ),
           SizedBox(
            height: height * 0.002,
           ),
           Text(
            projectDetail?.client?.phone
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
            "Last name",
            style: TextStyle(
                fontSize: height * 0.014,
                fontWeight: FontWeight.bold),
           ),
           SizedBox(
            height: height * 0.002,
           ),
           Text(
            projectDetail?.client?.lastName
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
            "User type",
            style: TextStyle(
                fontSize: height * 0.014,
                fontWeight: FontWeight.bold),
           ),
           SizedBox(
            height: height * 0.002,
           ),
           Text(
            'Client',
            overflow: TextOverflow.ellipsis,
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
      ],
     ),
    );
  }
}
