class UserDetailModel {
  UserDetailModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.userType,
    this.isSubscription,
    this.trialEnded,
    this.occupation,
    this.company,
    this.signature,
    this.username,
    this.profilePicture,
    this.safetyCard,
    this.tradeLicence,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? userType;
  String? isSubscription;
  DateTime? trialEnded;
  Occupation? occupation;
  String? company;
  String? signature;
  String? username;
  String? profilePicture;
  String? safetyCard;
  String? tradeLicence;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) => UserDetailModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        userType: json["user_type"],
        isSubscription: json["is_subscription"],
        trialEnded: DateTime.parse(json["trial_ended"]),
        occupation: Occupation.fromJson(json["occupation"]),
        company: json["company"],
        signature: json["signature"],
        username: json["username"],
        profilePicture: json["profile_picture"],
        safetyCard: json["safety_card"],
        tradeLicence: json["trade_licence"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "user_type": userType,
        "is_subscription": isSubscription,
        "trial_ended":
            "${trialEnded?.year.toString().padLeft(4, '0')}-${trialEnded?.month.toString().padLeft(2, '0')}-${trialEnded?.day.toString().padLeft(2, '0')}",
        "occupation": occupation?.toJson(),
        "company": company,
        "signature": signature,
        "username": username,
        "profile_picture": profilePicture,
        "safety_card": safetyCard,
        "trade_licence": tradeLicence,
      };
}

class Occupation {
  Occupation({
    this.name,
    this.id,
  });

  String? name;
  int? id;

  factory Occupation.fromJson(Map<String, dynamic> json) => Occupation(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
