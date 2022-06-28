// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.projectId,
    this.name,
    this.projectName,
    this.categoryName,
    this.auditorName,
    this.translatorName,
    this.customerId,
    this.customerName,
    this.description,
    this.originalContent,
    this.translatedContent,
    this.languageFrom,
    this.languageTo,
    this.numberOfWords,
    this.status,
    this.translatorId,
    this.auditorId,
    this.fee,
    this.deadline,
    this.completedOn,
    this.completedBy,
    this.verifiedOn,
    this.verifiedBy,
    this.createdOn,
    this.createdBy,
    this.modifiedOn,
    this.modifiedBy,
  });

  String? id;
  String? projectId;
  String? name;
  String? projectName;
  String? categoryName;
  dynamic auditorName;
  dynamic translatorName;
  dynamic customerId;
  String? customerName;
  String? description;
  String? originalContent;
  dynamic translatedContent;
  String? languageFrom;
  String? languageTo;
  int? numberOfWords;
  String? status;
  dynamic translatorId;
  dynamic auditorId;
  double? fee;
  DateTime? deadline;
  dynamic completedOn;
  dynamic completedBy;
  dynamic verifiedOn;
  dynamic verifiedBy;
  DateTime? createdOn;
  String? createdBy;
  dynamic modifiedOn;
  dynamic modifiedBy;

  User copyWith({
    String? id,
    String? projectId,
    String? name,
    String? projectName,
    String? categoryName,
    dynamic auditorName,
    dynamic translatorName,
    dynamic customerId,
    String? customerName,
    String? description,
    String? originalContent,
    dynamic translatedContent,
    String? languageFrom,
    String? languageTo,
    int? numberOfWords,
    String? status,
    dynamic translatorId,
    dynamic auditorId,
    double? fee,
    DateTime? deadline,
    dynamic completedOn,
    dynamic completedBy,
    dynamic verifiedOn,
    dynamic verifiedBy,
    DateTime? createdOn,
    String? createdBy,
    dynamic modifiedOn,
    dynamic modifiedBy,
  }) =>
      User(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        name: name ?? this.name,
        projectName: projectName ?? this.projectName,
        categoryName: categoryName ?? this.categoryName,
        auditorName: auditorName ?? this.auditorName,
        translatorName: translatorName ?? this.translatorName,
        customerId: customerId ?? this.customerId,
        customerName: customerName ?? this.customerName,
        description: description ?? this.description,
        originalContent: originalContent ?? this.originalContent,
        translatedContent: translatedContent ?? this.translatedContent,
        languageFrom: languageFrom ?? this.languageFrom,
        languageTo: languageTo ?? this.languageTo,
        numberOfWords: numberOfWords ?? this.numberOfWords,
        status: status ?? this.status,
        translatorId: translatorId ?? this.translatorId,
        auditorId: auditorId ?? this.auditorId,
        fee: fee ?? this.fee,
        deadline: deadline ?? this.deadline,
        completedOn: completedOn ?? this.completedOn,
        completedBy: completedBy ?? this.completedBy,
        verifiedOn: verifiedOn ?? this.verifiedOn,
        verifiedBy: verifiedBy ?? this.verifiedBy,
        createdOn: createdOn ?? this.createdOn,
        createdBy: createdBy ?? this.createdBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        projectId: json["projectId"],
        name: json["name"],
        projectName: json["projectName"],
        categoryName: json["categoryName"],
        auditorName: json["auditorName"],
        translatorName: json["translatorName"],
        customerId: json["customerId"],
        customerName: json["customerName"],
        description: json["description"],
        originalContent: json["originalContent"],
        translatedContent: json["translatedContent"],
        languageFrom: json["languageFrom"],
        languageTo: json["languageTo"],
        numberOfWords: json["numberOfWords"],
        status: json["status"],
        translatorId: json["translatorId"],
        auditorId: json["auditorId"],
        fee: json["fee"],
        deadline: DateTime.parse(json["deadline"]),
        completedOn: json["completedOn"],
        completedBy: json["completedBy"],
        verifiedOn: json["verifiedOn"],
        verifiedBy: json["verifiedBy"],
        createdOn: DateTime.parse(json["createdOn"]),
        createdBy: json["createdBy"],
        modifiedOn: json["modifiedOn"],
        modifiedBy: json["modifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "projectId": projectId,
        "name": name,
        "projectName": projectName,
        "categoryName": categoryName,
        "auditorName": auditorName,
        "translatorName": translatorName,
        "customerId": customerId,
        "customerName": customerName,
        "description": description,
        "originalContent": originalContent,
        "translatedContent": translatedContent,
        "languageFrom": languageFrom,
        "languageTo": languageTo,
        "numberOfWords": numberOfWords,
        "status": status,
        "translatorId": translatorId,
        "auditorId": auditorId,
        "fee": fee,
        "deadline": deadline!.toIso8601String(),
        "completedOn": completedOn,
        "completedBy": completedBy,
        "verifiedOn": verifiedOn,
        "verifiedBy": verifiedBy,
        "createdOn": createdOn!.toIso8601String(),
        "createdBy": createdBy,
        "modifiedOn": modifiedOn,
        "modifiedBy": modifiedBy,
      };
}
