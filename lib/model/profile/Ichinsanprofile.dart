import 'dart:convert';

import 'package:intl/intl.dart';

List<IchinsanProfile> ichinsanProfileFromJson(String str) =>
    List<IchinsanProfile>.from(
        json.decode(str).map((x) => IchinsanProfile.fromJson(x)));

String ichinsanProfileToJson(List<IchinsanProfile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IchinsanProfile {
  IchinsanProfile(
      {this.languageSkill,
      this.technique,
      this.id,
      this.fullName,
      this.role,
      this.gender,
      this.birthday,
      this.website,
      this.phoneNumber,
      this.email,
      this.balance,
      this.aboutMe,
      this.avatarImage});

  List<dynamic>? languageSkill;
  String? technique;
  String? id;
  String? fullName;
  String? role;
  String? gender;
  DateTime? birthday;
  String? website;
  String? phoneNumber;
  String? email;
  double? balance;
  String? aboutMe;
  String? avatarImage;

  IchinsanProfile copyWith(
          {List<dynamic>? languageSkill,
          String? technique,
          String? id,
          String? fullName,
          String? role,
          String? gender,
          DateTime? birthday,
          String? website,
          String? phoneNumber,
          String? email,
          double? balance,
          String? aboutMe,
          String? avatarImage}) =>
      IchinsanProfile(
          languageSkill: languageSkill ?? this.languageSkill,
          technique: technique ?? this.technique,
          id: id ?? this.id,
          fullName: fullName ?? this.fullName,
          role: role ?? this.role,
          gender: gender ?? this.gender,
          birthday: birthday ?? this.birthday,
          website: website ?? this.website,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          email: email ?? this.email,
          balance: balance ?? this.balance,
          aboutMe: aboutMe ?? this.aboutMe,
          avatarImage: avatarImage ?? this.avatarImage);

  String get getDob => DateFormat.yMMMMd().format(birthday!).toString();

  factory IchinsanProfile.fromJson(Map<String, dynamic> json) =>
      IchinsanProfile(
        languageSkill: List<dynamic>.from(json["languageSkill"].map((x) => x)),
        technique: json["technique"],
        id: json["id"],
        fullName: json["fullName"],
        role: json["role"],
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
        website: json["website"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        balance: json["balance"],
        aboutMe: json["aboutMe"],
      );

  Map<String, dynamic> toJson() => {
        "languageSkill": List<dynamic>.from(languageSkill!.map((x) => x)),
        "technique": technique,
        "id": id,
        "fullName": fullName,
        "role": role,
        "gender": gender,
        "birthday": birthday!.toIso8601String(),
        "website": website,
        "phoneNumber": phoneNumber,
        "email": email,
        "balance": balance,
        "aboutMe": aboutMe,
      };
}
