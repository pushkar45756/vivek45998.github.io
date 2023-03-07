class UserList {
  UserList({
    this.id,
  this.firstName,
     this.lastName,
     this.email,
 this.type,
 this.occupation,
  this.isActive,
  });

  int? id;
  String ?firstName;
  String ?lastName;
  String ?email;
  String ?type;
  Occupation? occupation;
  bool ?isActive;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    type: json["type"],
    occupation: Occupation.fromJson(json["occupation"]),
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "type": type,
    "occupation": occupation?.toJson(),
    "isActive": isActive,
  };
}

class Occupation {
  Occupation({
   this.id,
     this.name,
  });

  int ?id;
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