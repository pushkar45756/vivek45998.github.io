import 'package:web/model/user_data.dart';
import 'package:web/admin_dashboard.dart';

abstract class Routes {
  //static const  = '/';

  static const String dashboard = "/dashboard";
  static const String userPage = "/userPage";
  static const String projectPage = "/projectPage";
  static const String loginPage = "/";
  static const String samplePage = "/sample_page";
  static const String userDetail = "/userDetail";
  static const String userItem = "/userItem";
  static const String layoutPage = "/layoutPage/:user";
}