// To parse this JSON data, do
//
//     final articles = articlesFromMap(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// ignore: invalid_annotation_target
@JsonSerializable()
List<Articles> articlesFromMap(String str) =>
    List<Articles>.from(json.decode(str).map((x) => Articles.fromMap(x)));

String articlesToMap(List<Articles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Articles {
  Articles({
    required this.id,
    required this.projectId,
    this.projectCategoryName,
    required this.name,
    required this.projectName,
    required this.categoryName,
    required this.auditorName,
    required this.translatorName,
    this.customerId,
    required this.customerName,
    this.description,
    required this.originalContent,
    required this.translatedContent,
    required this.languageFrom,
    required this.languageTo,
    required this.numberOfWords,
    required this.status,
    required this.translatorId,
    required this.auditorId,
    required this.fee,
    this.deadline,
    this.completedOn,
    this.completedBy,
    this.verifiedOn,
    this.verifiedBy,
    required this.createdOn,
    this.createdBy,
    this.modifiedOn,
    this.modifiedBy,
  });

  String id;
  String projectId;
  dynamic projectCategoryName;
  String name;
  String projectName;
  String categoryName;
  String auditorName;
  String translatorName;
  dynamic customerId;
  String customerName;
  dynamic description;
  String originalContent;
  String translatedContent;
  String languageFrom;
  String languageTo;
  int numberOfWords;
  int status;
  String translatorId;
  String auditorId;
  double fee;
  dynamic deadline;
  dynamic completedOn;
  dynamic completedBy;
  dynamic verifiedOn;
  dynamic verifiedBy;
  DateTime createdOn;
  dynamic createdBy;
  dynamic modifiedOn;
  dynamic modifiedBy;

  factory Articles.fromMap(Map<String, dynamic> json) => Articles(
        id: json["id"],
        projectId: json["projectId"],
        projectCategoryName: json["projectCategoryName"],
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
        deadline: json["deadline"],
        completedOn: json["completedOn"],
        completedBy: json["completedBy"],
        verifiedOn: json["verifiedOn"],
        verifiedBy: json["verifiedBy"],
        createdOn: DateTime.parse(json["createdOn"]),
        createdBy: json["createdBy"],
        modifiedOn: json["modifiedOn"],
        modifiedBy: json["modifiedBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "projectId": projectId,
        "projectCategoryName": projectCategoryName,
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
        "deadline": deadline,
        "completedOn": completedOn,
        "completedBy": completedBy,
        "verifiedOn": verifiedOn,
        "verifiedBy": verifiedBy,
        "createdOn": createdOn.toIso8601String(),
        "createdBy": createdBy,
        "modifiedOn": modifiedOn,
        "modifiedBy": modifiedBy,
      };
}
