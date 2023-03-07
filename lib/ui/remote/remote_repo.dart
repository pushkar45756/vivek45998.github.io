import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web/local_storage.dart';
import 'package:web/localstorage_sessionstorage/sessionstorage.dart';
import 'package:web/model/admin_data.dart';
import 'package:web/model/remote_project_detail_model.dart';
import 'package:web/model/remote_project_list_model.dart';
import 'package:web/model/user_data_list.dart';
import 'package:web/model/user_detail.dart';
import 'package:web/values/network_constants.dart';

//{\"status\":\"error\",\"code\":400,\"data\":{},\"message\":\"Invalid email/password.\"}
//"Something went wrong."
class RemoteRepo {
  static userLogin({required Map<String, String> userData}) async {
    var response = await http.post(
      Uri.parse(NetworkConstants.loginLocalEndPoint),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      print("response======${response.body}");
      var data = AdminData.fromJson(
        jsonDecode(response.body),
      );
      return data;
    } else {
      throw Exception(NetworkConstants.loginException);
    }
  }

  static userList() async {
    var response = await http.get(
      Uri.parse(NetworkConstants.userListApi),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey:
            "Bearer ${SessionStorage.getValue(LocalStorage.loginBearerToken)}"
      },
    );
    print("step1");
    if (response.statusCode == 200) {
      var data = List<UserList>.from(
          json.decode(response.body)['data'].map((x) => UserList.fromJson(x)));
      print("data=====$data");
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }

  static filterUserList({required String searchValue, required String searchKey}) async {
    print(searchValue);
    var response = await http.get(
      Uri.parse("${NetworkConstants.userListApiFilter}$searchKey=$searchValue"),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey:
            "Bearer ${SessionStorage.getValue(LocalStorage.loginBearerToken)}"
      },
    );
    print("url===${NetworkConstants.userListApiFilter}user_type=$searchValue");
    print("step1");
    if (response.statusCode == 200) {
      var data = List<UserList>.from(
          json.decode(response.body)['data'].map((x) => UserList.fromJson(x)));
      print("data=====$data");
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
  static userDetail(int id) async {
    var response = await http.get(
      Uri.parse("${NetworkConstants.userDetail}$id"),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey:
        "Bearer ${SessionStorage.getValue(LocalStorage.loginBearerToken)}",

      },
    );
    print("urluser===${NetworkConstants.userDetail}$id");
    print("step1");
    if (response.statusCode == 200) {
      var data = UserDetailModel.fromJson(
        jsonDecode(response.body)["data"],
      );
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
  static allProjects() async {
    var response = await http.get(
      Uri.parse(NetworkConstants.projectListApi),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey:
        "Bearer ${SessionStorage.getValue(LocalStorage.loginBearerToken)}"
      },
    );
    print("step1");
    if (response.statusCode == 200) {
      var data = List<ProjectModel>.from(
          json.decode(response.body)['data'].map((x) => ProjectModel.fromJson(x)));
      print("data=====$data");
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
 static projectDetail(int id) async {
    var response = await http.get(
      Uri.parse("${NetworkConstants.projectDetailApi}$id"),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey:
        "Bearer ${SessionStorage.getValue(LocalStorage.loginBearerToken)}",

      },
    );
    if (response.statusCode == 200) {
      var data = ProjectDetailModel.fromJson(
        jsonDecode(response.body)["data"],
      );
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }
  static filterProjectList({required String searchValue, required String searchKey}) async {
    print(searchValue);
    var response = await http.get(
      Uri.parse("${NetworkConstants.projectListApiFilter}$searchKey=$searchValue"),
      headers: <String, String>{
        NetworkConstants.contentTypeKey: NetworkConstants.contentTypeValue,
        NetworkConstants.authorizationKey:
        "Bearer ${SessionStorage.getValue(LocalStorage.loginBearerToken)}"
      },
    );
    print("url===${NetworkConstants.projectListApiFilter}user_type=$searchValue");
    print("step1");
    if (response.statusCode == 200) {
      var data = List<ProjectModel>.from(
          json.decode(response.body)['data'].map((x) => ProjectModel.fromJson(x)));
      print("data=====$data");
      return data;
    } else {
      print("error====${response.body}");
      throw Exception(NetworkConstants.errorException);
    }
  }

}
