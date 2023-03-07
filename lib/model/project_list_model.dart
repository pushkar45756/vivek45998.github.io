class ProjectList {
  ProjectList({
    this.status,
    this.code,
    this.data,
    this.message,
  });

  String? status;
  int? code;
  Data? data;
  String? message;

  factory ProjectList.fromJson(Map<String, dynamic> json) =>
      ProjectList(
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
    this.id,
    this.name,
    this.address,
    this.client,
    this.description,
    this.scopeOfWork,
    this.createdDate,
    this.lastUpdated,
    this.worker,
    this.status,
    this.quotations,
    this.builder,
  });

  int? id;
  String? name;
  Address? address;
  Builder? client;
  String? description;
  List<dynamic>? scopeOfWork;
  DateTime? createdDate;
  DateTime? lastUpdated;
  List<dynamic>? worker;
  String? status;
  List<dynamic>? quotations;
  Builder? builder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        client: Builder.fromJson(json["client"]),
        description: json["description"],
        scopeOfWork: json["scope_of_work"] == null
            ? null
            : List<dynamic>.from(json["scope_of_work"].map((x) => x)),
        createdDate: DateTime.parse(json["created_date"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        worker: json["worker"] == null
            ? null
            : List<dynamic>.from(json["worker"].map((x) => x)),
        status: json["status"],
        quotations: json["quotations"] == null
            ? null
            : List<dynamic>.from(json["quotations"].map((x) => x)),
        builder: Builder.fromJson(json["builder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address?.toJson(),
        "client": client?.toJson(),
        "description": description,
        "scope_of_work": List<dynamic>.from(scopeOfWork!.map((x) => x)),
        "created_date": createdDate?.toIso8601String(),
        "last_updated": lastUpdated?.toIso8601String(),
        "worker": List<dynamic>.from(worker!.map((x) => x)),
        "status": status,
        "quotations": List<dynamic>.from(quotations!.map((x) => x)),
        "builder": builder?.toJson(),
      };
}

class Address {
  Address({
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  String name;
  double longitude;
  double latitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
      };
}

class Builder {
  Builder({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.profilePicture,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String profilePicture;

  factory Builder.fromJson(Map<String, dynamic> json) => Builder(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "profile_picture": profilePicture,
      };
}
