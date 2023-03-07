// ignore_for_file: must_be_immutable




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/local_storage.dart';
import 'package:web/model/user_data.dart';
import 'package:web/values/app_assets.dart';
import '../../values/app_assets.dart';

class UserDetail extends StatefulWidget {
  UserDetail({Key? key, this.user}) : super(key: key);
  UserData? user;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  UserData? user;

  @override
  initState() {
    // TODO: implement initState
    // Platform.window.onUnload.listen((event) async {
    //   print('Reloaded');
    //   // Navigator.pushNamed(context, RouterUrlName.userDetail);
    //   // Get.offNamed(RouterUrlName.samplePage);
    // });
    // html.window.onUnload.listen((event) async {
    //   print('Reloaded');
    //  // Navigator.pushNamed(context, RouterUrlName.userDetail);
    //  // Get.offNamed(RouterUrlName.samplePage);
    // });
    print('++++++++++++++++++++++++++++++++++++++++++++++++++++');
    super.initState();
    widget.user = Get.arguments;
    if (widget.user != null) {
      LocalStorage.saveData(LocalStorage.user, widget.user);
      LocalStorage.saveData(LocalStorage.isRefresh, true);
    } else {
      LocalStorage.saveData(LocalStorage.isRefresh, false);
    }
    userData();
    //print(user?.email);
  }

  userData() async {
    var data = LocalStorage.getData(LocalStorage.user);
    bool isRefresh = LocalStorage.getData(LocalStorage.isRefresh);
    //final u=jsonDecode(data);
    //  user=data;
    //  print("is=$isRefresh");
    if (isRefresh == true) {
      user = data;
      // LocalStorage.
    } else {
      var y = UserData.fromJson(data);
      user = y;
    }
    setState(() {
      // user=
    });
    //  user=data;
    //user=UserData.fromJson(data);
    //print("assssssssss${y?.firstName}");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.cyanAccent.withOpacity(0.4),
      body: Stack(
        children: [
          Text(
            "+++$width++",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
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
                  children: [
                    Column(
                      children: [
                        Text(
                          "+++width=$width++ height=$height",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
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
                      top: 70,
                      bottom: 2,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height * 0.55,
                            width: width * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(
                              //   width: 0.5,
                              //   color: Colors.blueAccent,
                              // ),
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
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(110),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0.5, 0.5),
                                        blurRadius: 0.5,
                                        color: Colors.white.withOpacity(0.5),
                                      )
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user?.image ?? ''),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  "${user?.firstName ?? ''} ${user?.lastName}"
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: width * 0.02),
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
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6.0),
                                    child: Text(
                                      "User detail".toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    border: Border.all(width: 0.4),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.035,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: height * 0.0016,
                                      right: height * 0.0016),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "First name",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          const Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          const Text(
                                            "Phone",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Last name",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          const Text(
                                            "Occupation",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          const Text(
                                            "User type",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
