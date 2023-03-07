// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:web/extention_function.dart';
import 'package:web/model/remote_project_detail_model.dart';
import 'package:web/model/remote_project_list_model.dart';
import 'package:web/values/app_colors.dart';

import '../../../../values/app_assets.dart';
import '../../../remote/remote_repo.dart';
import '../../../user/widget/project_detail_widget/builder_and_client_detail.dart';

class ProjectMobilePage extends StatefulWidget {
  ProjectMobilePage({Key? key, this.projectDetail, this.isMobile})
      : super(key: key);
  ProjectModel? projectDetail;
  bool? isMobile;

  @override
  State<ProjectMobilePage> createState() => _ProjectMobilePageState();
}

class _ProjectMobilePageState extends State<ProjectMobilePage> {
  ProjectDetailModel? projectDetailModel;
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
    userDetail();
  }

  userDetail() async {
    showLoader(true);
    var data = await RemoteRepo.projectDetail(widget.projectDetail?.id ?? 0);
    projectDetailModel = data;
    setState(() {});
    showLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Stack(

      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.backGroundImage),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: height * 0.14,
                bottom: height * 0.14,
                left: width * 0.1,
                right: width * 0.1),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: const Offset(0.5, 0.5),
                  color: Colors.white.withOpacity(0.8),
                ),
              ]),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: height * 0.26,
                        width: width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.backGroundImage),
                              fit: BoxFit.cover),
                        ),
                        // child: Image.asset(AppAssets.backGroundImage),
                      ),
                      Container(
                        // height: height*0.6,
                        width: width,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Positioned(
                    top: height * 0.0050,
                    bottom: height * 0.0020,
                    right: height * 0.0010,
                    left: height * 0.0010,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.25,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.5, 0.5),
                                blurRadius: 1,
                                color: Colors.grey,
                              ),
                              BoxShadow(
                                offset: Offset(-0.5, -0.5),
                                blurRadius: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Container(
                                  height: height * 0.13,
                                  width: height * 0.13,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(height * 0.13),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0.5, 0.5),
                                        blurRadius: 0.5,
                                        color: Colors.white.withOpacity(0.5),
                                      )
                                    ],
                                  ),
                                  child: /* widget.projectDetail?.builder.
                                    ?.n ==
                                    null
                                    ?*/
                                      CircleAvatar(
                                    backgroundColor: AppColor.appBarColor,
                                    child: Text(
                                      widget?.projectDetail?.builder
                                              ?.firstName![0]
                                              .capitalize() ??
                                          ''?.toString() ??
                                          '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.05),
                                    ),
                                  )
                                  //     : CircleAvatar(
                                  //   backgroundImage: NetworkImage(widget
                                  //       .projectDetail
                                  //       ?.data
                                  //       ?.builder
                                  //       ?.profilePicture ??
                                  //       ''),
                                  // ),
                                  ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Text(
                                "${widget.projectDetail?.builder?.firstName ?? ''} ${widget.projectDetail?.builder?.lastName}"
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: height * 0.01), /*width * 0.02*/
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 4.0, right: 4.0),
                                child: Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    border: Border.all(width: 0.5),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.03,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              "Project Detail".toUpperCase(),
                              style: TextStyle(
                                  fontSize: height * 0.019,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        Container(
                          height: height * 0.33,
                          width: width * 0.45,
                          //  color: Colors.blue,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0.5, 0.5),
                                blurRadius: 1,
                                color: Colors.grey,
                              ),
                              BoxShadow(
                                offset: Offset(-0.5, -0.5),
                                blurRadius: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: ProjectAndClientDetail(
                            projectList: projectDetailModel,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (isLoading)
                    const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: AppColor.appBarColor,
                        ))
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
