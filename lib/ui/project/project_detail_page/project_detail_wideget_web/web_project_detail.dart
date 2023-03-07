import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/extention_function.dart';
import 'package:web/model/project_list_model.dart';
import 'package:web/model/remote_project_detail_model.dart';

class ProjectClientWorkerWidget extends StatelessWidget {
  ProjectClientWorkerWidget({Key? key, this.projectDetail}) : super(key: key);
  ProjectDetailModel? projectDetail;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: height * 0.0016, right: height * 0.0016),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.025,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: Text(
                "Project Detail".toUpperCase(),
                style: TextStyle(
                    fontSize: height * 0.019, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 1),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          builderClient(height: height, width: width),
          SizedBox(
            height: height * 0.025,
          ),
        ],
      ),
    );
  }

  builderClient({required double height, required double width}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width*0.06,
        ),
        Expanded(
          child: projectData(
            height: height,
            width: width,
            text: "Project detail",
            title1: "Project name :",
            title1Value: projectDetail?.name?.toString().capitalize()??'',
            title2: "Status :",
            title2Value: projectDetail?.status,
            title3: "Created at :",
            title3Value: projectDetail?.createdDate?.toIso8601String(),
            title4: "Last update :",
            title4Value: projectDetail?.lastUpdated?.toIso8601String(),
            title5: "Description :",
            title5value: projectDetail?.description.toString().capitalize() ?? '',
          ),
        ),
        Expanded(
          child: projectData(
            height: height,
            width: width,
            text: "Client detail",
            title1: "First name :",
            title1Value: projectDetail?.client?.firstName.toString().capitalize()??'',
            title2: "Last name :",
            title2Value: projectDetail?.client?.lastName.toString().capitalize()??'',
            title3: "Email :",
            title3Value: projectDetail?.client?.email,
            title4: "Phone :",
            title4Value: projectDetail?.client?.phone,
            title5: "User type",
            title5value: "Client"..toString().capitalize(),
          ),
        ),

        //   projectData(height: height, width: width)
      ],
    );
  }

  projectData({
    required double height,
    required double width,
    required String text,
    required String title5value,
    required String title5,
    String? title4Value,
    required String title4,
    String? title3Value,
    required String title3,
    String? title2Value,
    required String title2,
    String? title1Value,
    required String title1,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.008,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding:  EdgeInsets.only(right: width*0.07),
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                  fontSize: width * 0.0098, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.016,
        ),
        detailPro(
            title: title1,
            titleValue: title1Value ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: title2,
            titleValue: title2Value ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: title3,
            titleValue: title3Value ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: title4,
            titleValue: title4Value ?? '',
            height: height,
            width: width),
        SizedBox(
          height: height * 0.012,
        ),
        detailPro(
            title: title5,
            titleValue: title5value,
            height: height,
            width: width),
      ],
    );
  }

  detailPro(
      {required String title,
        required String titleValue,
        required double height,
        required double width}) {
    return Row(
      children: [
        SizedBox(
          width: width * 0.006,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: width * 0.0098, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            titleValue,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: width * 0.0085),
          ),
        )
      ],
    );
  }
}
