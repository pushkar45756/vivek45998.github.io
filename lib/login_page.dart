import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:velocity_x/velocity_x.dart';

import 'package:web/extention_function.dart';
import 'package:web/local_storage.dart';
import 'package:web/localstorage_sessionstorage/localstorage.dart';
import 'package:web/localstorage_sessionstorage/sessionstorage.dart';
import 'package:web/model/admin_data.dart';
import 'package:web/route/router_url_name.dart';
import 'package:web/ui/remote/remote_repo.dart';
import 'package:web/utiils/utils.page.dart';
import 'package:web/values/app_assets.dart';
import 'package:web/values/app_colors.dart';
import 'package:web/values/app_strings.dart';
import 'dart:html' as html;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String id = "loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();


  double height = 0;
  double width = 0;

  @override
  bool _isChecked = false;

  validLogin() async {
    var email = emailCtrl.text.trim().toString();
    var pass = passCtrl.text.trim().toString();
    var userData = {"email": email, "password": pass};
    if (email.isEmpty) {
      Utils.showSnackBar(AppStrings.emailEmpty, context, Colors.red);
      return false;
    } else if (emailCtrl.text.isValidEmail(emailCtrl.text) == false) {
      Utils.showSnackBar(AppStrings.emailBadlyFormated, context, Colors.red);
      return false;
    } else if (pass.isEmpty) {
      Utils.showSnackBar(AppStrings.passEmpty, context, Colors.red);
      return false;
    } else if (pass.length < 6) {
      Utils.showSnackBar(AppStrings.lengthPass, context, Colors.red);
      return false;
    }
    // else if (pass.validateStructure(pass) == false) {
    //   Utils.showSnackBar(AppStrings.passCombineError, context, Colors.red);
    //   return false;
    // }
    else {


      var data = await RemoteRepo.userLogin(userData: userData);
      //if(data==)
      AdminData adminData = data;
      if(data.data.email==null){
        Utils.showSnackBar(data.message, context, Colors.red);
        return false;
      }
      else{
        print("1====$data=====2");
        print("1====${data.message}=====2");
        LocalStorage.saveData(
            LocalStorage.loginBearerToken, adminData.data?.jwtToken);
        LocalStorageWindow.saveValue(LocalStorage.loginBearerToken, adminData.data?.jwtToken??'');
        SessionStorage.saveValue(LocalStorage.loginBearerToken, adminData.data?.jwtToken??'');

        //  html.window.localStorage;
        // Get.rootDelegate.toNamed(RouterUrlName.samplePage);
        context.vxNav.clearAndPush(Uri.parse(RouterUrlName.samplePage));

        // context.vxNav.clearAndPush(Uri.parse(RouterUrlName.samplePage));
      }
      emailCtrl.clear();
      passCtrl.clear();
      return true;
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   var email = LocalStorage.getData(LocalStorage.email);
  //   print('4====$email');
  //   if (email != null) {
  //     context.vxNav.push(Uri.parse(RouterUrlName.samplePage));
  //     //Get.rootDelegate.toNamed(RouterUrlName.samplePage);
  //   }
  //
  //   // html.window.onUnload.listen((event) async {
  //   //   print('Reloaded====$email');
  //   //   if(email!=null){
  //   //    // Get.toNamed(RouterUrlName.samplePage);
  //   //     Get.offAllNamed(RouterUrlName.samplePage);
  //   //
  //   //   }
  //   //   // Navigator.pushNamed(context, RouterUrlName.userDetail);
  //   //   // Get.offNamed(RouterUrlName.samplePage);
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: width > 480
            ? Row(children: [
                Container(
                  height: height,
                  width: width * 0.5,
                  decoration: const BoxDecoration(
                      // color: Colors.blue.withOpacity(0.2),
                      image: DecorationImage(
                    image: AssetImage(AppAssets.splashBackgroundImage),
                    fit: BoxFit.cover,
                  )),
                  child: Image.asset(
                    AppAssets.buildEziIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  color: AppColor.loginBackground,
                  width: width * 0.5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.03),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: width * 0.01),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Image.asset(
                              AppAssets.buildEziPngIcon,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            // height: height * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 6,
                                  offset: Offset(0, 0), // Shadow position
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height * 0.04),
                                  Center(
                                    child: Text(
                                      AppStrings.loginTitle,
                                      style: GoogleFonts.inter(
                                        fontSize: height * 0.025,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.03),
                                  Text(
                                    AppStrings.enterEmailLabel,
                                    style: TextStyle(fontSize: height * 0.02),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: TextField(
                                      controller: emailCtrl,

                                      decoration: const InputDecoration(
                                          hintText: AppStrings.email,
                                          border: OutlineInputBorder()),
                                      style: TextStyle(fontSize: height * 0.02),

                                      //...
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Text(
                                    AppStrings.enterPasswordLabel,
                                    style: TextStyle(fontSize: height * 0.02),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: TextField(
                                      controller: passCtrl,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          hintText: AppStrings.password,
                                          border: OutlineInputBorder()),
                                      style: TextStyle(fontSize: height * 0.02),
                                      //...
                                    ),
                                  ),
                                  SizedBox(height: height * 0.03),
                                  InkWell(
                                    onTap: () {
                                      validLogin();
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const SamplePage(),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue.withOpacity(0.2),
                                              const Color.fromARGB(
                                                  255, 29, 221, 163)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                        AppStrings.login,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: height * 0.02,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.04),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ])
            : SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: const BoxDecoration(
                        // color: Colors.blue.withOpacity(0.2),
                        image: DecorationImage(
                      image: AssetImage(AppAssets.splashBackgroundImage),
                      fit: BoxFit.cover,
                    )),
                    child: Image.asset(
                      AppAssets.buildEziIcon,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    color: AppColor.loginBackground,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.03),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: width * 0.01),
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.015),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Image.asset(
                                    AppAssets.buildEziPngIcon,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  // height: height * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 6,
                                        offset: Offset(0, 0), // Shadow position
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.05),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: height * 0.04),
                                        Center(
                                          child: Text(
                                            AppStrings.loginTitle,
                                            style: GoogleFonts.inter(
                                              fontSize: height * 0.025,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: height * 0.03),
                                        Text(
                                          AppStrings.enterEmailLabel,
                                          style: TextStyle(
                                              fontSize: height * 0.02),
                                        ),
                                        SizedBox(
                                          height: height * 0.08,
                                          child: TextField(
                                            controller: emailCtrl,
                                            decoration: const InputDecoration(
                                                hintText: AppStrings.email,
                                                border: OutlineInputBorder()),
                                            style: TextStyle(
                                                fontSize: height * 0.02),

                                            //...
                                          ),
                                        ),
                                        SizedBox(height: height * 0.02),
                                        Text(
                                          AppStrings.enterPasswordLabel,
                                          style: TextStyle(
                                              fontSize: height * 0.02),
                                        ),
                                        SizedBox(
                                          height: height * 0.08,
                                          child: TextField(
                                            controller: passCtrl,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                                hintText: AppStrings.password,
                                                border: OutlineInputBorder()),
                                            style: TextStyle(
                                                fontSize: height * 0.02),
                                            //...
                                          ),
                                        ),
                                        SizedBox(height: height * 0.03),
                                        InkWell(
                                          onTap: () {
                                            validLogin();
                                          },
                                          child: Container(
                                            height: height * 0.06,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.blue
                                                        .withOpacity(0.2),
                                                    const Color.fromARGB(
                                                        255, 29, 221, 163)
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                                child: Text(
                                              "Login",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: height * 0.02,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ),
                                        ),
                                        SizedBox(height: height * 0.04),
                                      ],
                                    ),
                                  ),
                                ),
                              ])

                          // TextButton(
                          //   style: ButtonStyle(
                          //
                          //   ),
                          //   onPressed: () {
                          //
                          //   },
                          //   child: const Text("Login"),
                          // ),
                          // const SizedBox(height: 15),
                          // TextButton(onPressed: () {  }, child: Text(),
                          //   //...
                          // ),
                          ),
                    ),
                  ),
                ]),
              ));
  }
}
