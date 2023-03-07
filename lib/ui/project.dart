import 'package:flutter/material.dart';


class ProjectPageList extends StatefulWidget {
  const ProjectPageList({Key? key}) : super(key: key);
  static const String id = "projectPage";

  @override
  State<ProjectPageList> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPageList> {
  double height=0.0;
  double width=0.0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  Text("lsjl");
    return const Scaffold(
      body: Center(
        child: Text("project"),
      ),
    );
  }

}


