import 'dart:convert';

NewAccount newAccountFromJson(String str) =>
    NewAccount.fromJson(json.decode(str));

String newAccountToJson(NewAccount data) => json.encode(data.toJson());

class NewAccount {
  NewAccount({
    this.email,
    this.fullName,
    this.phoneNumber,
    this.dob,
    this.gender,
    this.website,
    this.role,
  });

  String? email;
  String? fullName;
  String? phoneNumber;
  DateTime? dob;
  int? gender;
  String? website;
  String? role;

  NewAccount copyWith({
    String? email,
    String? fullName,
    String? phoneNumber,
    DateTime? dob,
    int? gender,
    String? website,
    String? role,
  }) =>
      NewAccount(
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        website: website ?? this.website,
        role: role ?? this.role,
      );

  factory NewAccount.fromJson(Map<String, dynamic> json) => NewAccount(
        email: json["email"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        website: json["website"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "dob": dob!.toIso8601String(),
        "gender": gender,
        "website": website,
        "role": role,
      };
}
