class ProjectDetailModel {
  ProjectDetailModel({
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

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) =>
      ProjectDetailModel(
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
    this.name,
    this.longitude,
    this.latitude,
  });

  String? name;
  double? longitude;
  double? latitude;

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
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.profilePicture,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? profilePicture;

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
