import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

class UserModel {
  UserModel({
    this.email,
    this.profileId,
    this.balance,
  });

  String? email;
  String? profileId;
  double? balance;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
