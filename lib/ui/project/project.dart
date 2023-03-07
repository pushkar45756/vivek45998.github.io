import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/model/project_list_model.dart';
import 'package:web/model/remote_project_list_model.dart';
import 'package:web/ui/project/prject_list_widget.dart';
import 'package:web/values/app_colors.dart';

import '../../values/app_assets.dart';
import '../remote/remote_repo.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  var projectData = <ProjectModel>[];
  var searchProjectList = <ProjectModel>[];
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

    projectList();
    // BackButtonInterceptor.add(myInterceptor);
  }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   print("BACK BUTTON!"); // Do some stuff.
  //   return true;
  // }

  String dropdownValue = 'PROJECT STATUS';
  var items = ['PROJECT NAME', 'PROJECT STATUS', "CREATED BY"];

  projectList() async {
    showLoader(true);
    var data = await RemoteRepo.allProjects();
    projectData.clear();
    searchProjectList.clear();
    setState(() {
      projectData.addAll(data);
      searchProjectList.addAll(data);
    });
    showLoader(false);
  }

  readJsonUserList() async {
    var projectDatak = await rootBundle.loadString(AppAssets.projectJson);
    var list = List<ProjectList>.from(
        jsonDecode(projectDatak).map((x) => ProjectList.fromJson(x)));
    projectData.clear();
    searchProjectList.clear();
    setState(() {});
  }

  filterUserList(String value) async {
    if (value.isNotEmpty) {
      if (dropdownValue == "PROJECT STATUS") {
        searchProjectList.clear();
        showLoader(true);
        var data = await RemoteRepo.filterProjectList(
          searchValue: value,
          searchKey: "status",
        );
        showLoader(false);
        if (data != null) {
          setState(() {
            print("hello filter$data");
            searchProjectList.addAll(data);
          });
        }
      }
      if (dropdownValue == "PROJECT NAME") {
        searchProjectList.clear();
        showLoader(true);
        var data = await RemoteRepo.filterProjectList(
          searchValue: value,
          searchKey: "project_name",
        );
        showLoader(false);
        if (data != null) {
          setState(() {
            print("hello filter$data");
            searchProjectList.addAll(data);
          });
        }
      }
      if (dropdownValue == "CREATED BY") {
        searchProjectList.clear();
        showLoader(true);
        var data = await RemoteRepo.filterProjectList(
          searchValue: value,
          searchKey: "created_by",
        );
        showLoader(false);
        if (data != null) {
          setState(() {
            print("hello filter$data");
            searchProjectList.addAll(data);
          });
        }
      }
    } else {
      searchProjectList.clear();
      searchProjectList.addAll(projectData);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: height * 0.016, right: height * 0.016),
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
                        filterUserList(searchController.text);
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
                            controller: searchController,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                searchProjectList.clear();
                                searchProjectList.addAll(projectData);
                                setState(() {});
                              }
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5),
                                border: InputBorder.none,
                                hintText: "Search"),
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
                      // After selecting the desired option,it will
                      // change button value to selected value
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
          Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  var projectDetail = searchProjectList[index];
                  return ProjectItem(projectDetail: projectDetail);
                },
                itemCount: searchProjectList.length,
              ),
              if (isLoading)
                Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.appBarColor,
                    backgroundColor: AppColor.appBarColor.withOpacity(0.5),
                  ),
                )
            ],
          ),
        ],
      ),
    );
    return const Scaffold(
      body: Center(
        child: Text("user"),
      ),
    );
  }
}
