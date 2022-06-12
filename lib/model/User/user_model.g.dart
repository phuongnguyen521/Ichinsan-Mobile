part of 'user_model.dart';

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"] as String?,
      profileId: json["profileId"] as String?,
      balance: json["balance"] as double?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      "email": instance.email,
      "profileId": instance.profileId,
      "balance": instance.balance,
    };
