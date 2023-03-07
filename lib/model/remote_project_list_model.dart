class ProjectModel {
  ProjectModel({
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
  List<String>? scopeOfWork;
  DateTime? createdDate;
  DateTime? lastUpdated;
  List<dynamic>? worker;
  String? status;
  List<dynamic>? quotations;
  Builder? builder;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        client: Builder.fromJson(json["client"]),
        description: json["description"],
        scopeOfWork: List<String>.from(json["scope_of_work"].map((x) => x)),
        createdDate: DateTime.parse(json["created_date"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        worker: List<dynamic>.from(json["worker"].map((x) => x)),
        status: json["status"],
        quotations: List<dynamic>.from(json["quotations"].map((x) => x)),
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
    this.id,
    this.name,
    this.longitude,
    this.latitude,
  });

  int? id;
  String? name;
  double? longitude;
  double? latitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
      };
}

class Builder {
  Builder({
    this.email,
    this.firstName,
    this.lastName,
    this.userType,
    this.occupation,
    this.jwtToken,
  });

  String? email;
  String? firstName;
  String? lastName;
  String? userType;
  Occupation? occupation;
  String? jwtToken;

  factory Builder.fromJson(Map<String, dynamic> json) => Builder(
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userType: json["user_type"],
        occupation: Occupation.fromJson(json["occupation"]),
        jwtToken: json["jwt_token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "user_type": userType,
        "occupation": occupation?.toJson(),
        "jwt_token": jwtToken,
      };
}

class Occupation {
  Occupation({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Occupation.fromJson(Map<String, dynamic> json) => Occupation(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
