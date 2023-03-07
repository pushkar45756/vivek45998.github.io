class UserData {
  UserData(
      {this.firstName,
      this.lastName,
      this.email,
      this.id,
      this.type,
      this.image,
      this.occupation,
      this.phone,
      this.trialEnded,
      this.isActive});

  String? firstName;
  String? lastName;
  String? email;
  String? id;
  String? type;
  String? image;
  Occupation? occupation;
  String? phone;
  DateTime? trialEnded;
  bool? isActive;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        id: json["id"],
        type: json["type"],
        image: json["image"],
        occupation: Occupation.fromJson(json["occupation"]),
        phone: json["phone"],
        trialEnded: DateTime.parse(json["trial_ended"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "id": id,
        "type": type,
        "image": image,
        "occupation": occupation?.toJson(),
        "phone": phone,
        "isActive": isActive,
        "trial_ended":
            "${trialEnded?.year.toString().padLeft(4, '0')}-${trialEnded?.month.toString().padLeft(2, '0')}-${trialEnded?.day.toString().padLeft(2, '0')}",
      };
}

class Occupation {
  Occupation({
    this.id,
    this.name,
  });

  String? id;
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
