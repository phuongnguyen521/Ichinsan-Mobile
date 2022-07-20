import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

class Account {
  Account({
    this.id,
    this.profileId,
    this.email,
    this.token,
    this.role,
  });

  String? id;
  String? profileId;
  String? email;
  String? token;
  String? role;

  Account copyWith({
    String? id,
    String? profileId,
    String? email,
    String? token,
    String? role,
  }) =>
      Account(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        email: email ?? this.email,
        token: token ?? this.token,
        role: role ?? this.role,
      );

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        profileId: json["profileId"],
        email: json["email"],
        token: json["token"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profileId": profileId,
        "email": email,
        "token": token,
        "role": role,
      };
}
