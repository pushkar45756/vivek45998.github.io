import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/model/user_data.dart';
import 'package:web/ui/user/user_item.dart';
import 'package:web/values/app_assets.dart';
import 'package:web/values/app_colors.dart';

import '../../model/user_data_list.dart';
import '../remote/remote_repo.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  //var userData = <UserData>[];
  var userData = <UserList>[];
  var searchUserList = <UserList>[];
  var type = "";
  var occupation = "";
  var searchController = TextEditingController();
  bool isLoading = true;

  showLoader(value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void initState() {
    super.initState();
    userListApi();
  }

  userListApi() async {
    showLoader(true);
    var data = await RemoteRepo.userList();
    userData.clear();
    setState(() {
      userData.addAll(data);
      searchUserList.addAll(data);
    });
    showLoader(false);
  }

  bool isEnabled = false;

  String dropdownValue = 'USER TYPE';
  var items = ['USER TYPE', 'OCCUPATION TYPE', "USER NAME"];

  readJsonUserList() async {
    var us = await rootBundle.loadString(AppAssets.userJson);
    var list =
        List<UserData>.from(jsonDecode(us).map((x) => UserData.fromJson(x)));
    userData.clear();
    setState(() {
      // userData.addAll(list);
      //  searchUserList.addAll(list);
    });
  }

  filterUserList(String value) async {
    if (value.isNotEmpty) {
      if (dropdownValue == "USER TYPE") {
        searchUserList.clear();
        //  var userType = {"user_type": value};
        print("hello filter1$value");
        // var filterMap = "${NetworkConstants.userListApiFilter}$userType";
        showLoader(true);
        var data = await RemoteRepo.filterUserList(
          searchValue: value,
          searchKey: "user_type",
        );
        if (data != null) {
          setState(() {
            print("hello filter$data");
            searchUserList.addAll(data);
          });
        }
        showLoader(false);
        print("hello filter2");
      }
      if (dropdownValue == "OCCUPATION TYPE") {
        searchUserList.clear();
        showLoader(true);
        var data = await RemoteRepo.filterUserList(
          searchValue: value,
          searchKey: "occupation",
        );
        if (data != null) {
          setState(() {
            print("hello filter$data");
            searchUserList.addAll(data);
          });
        }
        showLoader(false);
      }
      if (dropdownValue == "USER NAME") {
        searchUserList.clear();
        showLoader(true);
        var data = await RemoteRepo.filterUserList(
          searchValue: value,
          searchKey: "fullname",
        );
        if (data != null) {
          setState(() {
            print("hello filter$data");
            searchUserList.addAll(data);
          });
        }
        showLoader(false);
      }
    } else {
      searchUserList.clear();
      searchUserList.addAll(userData);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: height * 0.016, right: height * 0.016),
                child: InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // setState(() {
                            //   isEnabled = true;
                            // });
                            filterUserList(searchController.text.toString());
                          },
                          child: Icon(
                            Icons.search,
                            size: height * 0.045,
                            color: AppColor.appBarColor,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: width,
                            child: Center(
                              child: TextField(
                                //renabled: isEnabled,
                                //  showCursor: isEnabled,

                                controller: searchController,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    print("value====$value");
                                    setState(() {});
                                    searchUserList.clear();
                                    searchUserList.addAll(userData);
                                  }
                                },
                                // onSubmitted: (v){
                                //   filterUserList(v);
                                // },
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5),
                                  // labelText:"Search",
                                  hintText: "Search",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        DropdownButton(
                          // Initial Value
                          underline: const SizedBox(),
                          value: dropdownValue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  var user = searchUserList[index];
                  return UserItem(
                    user: user,
                    key: UniqueKey(),
                  );
                },
                itemCount: searchUserList.length,
              ),
            ],
          ),
          if (isLoading == true)
            Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: AppColor.appBarColor,
                backgroundColor: AppColor.appBarColor.withOpacity(0.5),
              ),
            )
        ],
      ),
    );
  }
}
