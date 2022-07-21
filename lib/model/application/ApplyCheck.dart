// To parse this JSON data, do
//
//     final applyCheck = applyCheckFromMap(jsonString);

import 'dart:convert';

List<ApplyCheck> applyCheckFromMap(String str) => List<ApplyCheck>.from(json.decode(str).map((x) => ApplyCheck.fromMap(x)));

String applyCheckToMap(List<ApplyCheck> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ApplyCheck {
  ApplyCheck({
    this.id,
    this.profileId,
    this.projectId,
    this.articleId,
    this.applyBy,
    this.appliedBy,
    this.appliedOn,
    this.status,
    this.articleName,
    this.salary,
    this.languageFromName,
    this.languageToName,
  });

  String? id;
  String? profileId;
  String? projectId;
  String? articleId;
  String? applyBy;
  String? appliedBy;
  DateTime? appliedOn;
  String? status;
  String? articleName;
  double? salary;
  String? languageFromName;
  String? languageToName;

  factory ApplyCheck.fromMap(Map<String, dynamic> json) => ApplyCheck(
    id: json["id"],
    profileId: json["profileId"] == null ? null : json["profileId"],
    projectId: json["projectId"],
    articleId: json["articleId"],
    applyBy: json["applyBy"] == null ? null : json["applyBy"],
    appliedBy: json["appliedBy"],
    appliedOn: json["appliedOn"] == null ? null : DateTime.parse(json["appliedOn"]),
    status: json["status"],
    articleName: json["articleName"],
    salary: json["salary"],
    languageFromName: json["languageFromName"],
    languageToName: json["languageToName"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "profileId": profileId == null ? null : profileId,
    "projectId": projectId,
    "articleId": articleId,
    "applyBy": applyBy == null ? null : applyBy,
    "appliedBy": appliedBy,
    "appliedOn": appliedOn == null ? null : appliedOn!.toIso8601String(),
    "status": status,
    "articleName": articleName,
    "salary": salary,
    "languageFromName": languageFromName,
    "languageToName": languageToName,
  };
}


