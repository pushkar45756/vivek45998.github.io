// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/model/user_detail.dart';

import '../../../model/user_data_list.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({Key? key, this.user}) : super(key: key);
  UserDetailModel? user;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              "User detail".toUpperCase(),
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
          height: height * 0.032,
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
                        "First name",
                        style: TextStyle(
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                        user?.firstName.toString().capitalizeFirst ?? '',
                        style: TextStyle(
                            fontSize: height * 0.016,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                        user?.email.toString().capitalizeFirst ?? '',
                        style: TextStyle(
                            fontSize: height * 0.016,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                         user?.phone.toString().capitalizeFirst ??'',
                        //'12123545545',
                        style: TextStyle(
                            fontSize: height * 0.016,
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
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                        user?.lastName.toString().capitalizeFirst ?? '',
                        style: TextStyle(
                            fontSize: height * 0.016,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "Occupation",
                        style: TextStyle(
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                        user?.occupation?.name.toString().capitalizeFirst ?? '',
                        style: TextStyle(
                            fontSize: height * 0.016,
                            fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        "User type",
                        style: TextStyle(
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * 0.002,
                      ),
                      Text(
                        user?.userType.toString().capitalizeFirst ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: height * 0.016,
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
        )
      ],
    );
  }
}
