class AdminData {
  AdminData({
    this.status,
    this.code,
    this.data,
    this.message,
  });

  String? status;
  int? code;
  Data? data;
  String? message;

  factory AdminData.fromJson(Map<String, dynamic> json) => AdminData(
        status: json["status"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.jwtToken,
    this.email,
    this.firstName,
    this.lastName,
    this.userType,
  });

  String? jwtToken;
  String? email;
  String? firstName;
  String? lastName;
  String? userType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        jwtToken: json["jwt_token"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userType: json["user_type"],
      );

  Map<String, dynamic> toJson() => {
        "jwt_token": jwtToken,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "user_type": userType,
      };
}
