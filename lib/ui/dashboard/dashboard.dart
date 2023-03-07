import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const String id="dashboard-screen";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
   print("==========dashboard===========");
    super.initState();
    readJsonUserList();
  }
  readJsonUserList(){

  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("dashboard"),
    );
    return const Scaffold(
      body: Text("")
    );
  }
}
