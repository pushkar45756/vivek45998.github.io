// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/model/user_data_list.dart';
import 'package:web/values/app_colors.dart';

import '../../../model/user_detail.dart';
import '../../../values/app_assets.dart';
import '../../remote/remote_repo.dart';
import '../widget/widget_user_detail.dart';

class DesktopPage extends StatefulWidget {
  DesktopPage({Key? key, this.user}) : super(key: key);
  UserList? user;

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  UserDetailModel? userDetailModel;
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
    var data = await RemoteRepo.userDetail(widget.user?.id ?? 0);
    userDetailModel = data;
    setState(() {});
    showLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.cyanAccent.withOpacity(0.4),
      body: Stack(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.55,
                            width: width * 0.16,
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
                                  height: height * 0.2,
                                  width: height * 0.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(height * 0.2),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0.5, 0.5),
                                        blurRadius: 0.5,
                                        color: Colors.white.withOpacity(0.5),
                                      )
                                    ],
                                  ),
                                  child: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80-"),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  "${userDetailModel?.firstName ?? ''} ${userDetailModel?.lastName}"
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: width * 0.012),
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
                            width: width * 0.02,
                          ),
                          Container(
                              height: height * 0.55,
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
                              child: DetailWidget(
                                user: userDetailModel,
                              ))
                        ],
                      ),
                    ),
                    if (isLoading)
                      CircularProgressIndicator(
                        color: AppColor.appBarColor,
                        backgroundColor:AppColor.appBarColor.withOpacity(0.5) ,
                      )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
