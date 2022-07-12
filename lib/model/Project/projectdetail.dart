// To parse this JSON data, do
//
//     final projectsDetail = projectsDetailFromMap(jsonString);

import 'dart:convert';

import 'package:ichinsan_mobile/model/Article/articles.dart';

ProjectsDetail projectsDetailFromMap(String str) => ProjectsDetail.fromMap(json.decode(str));

String projectsDetailToMap(ProjectsDetail data) => json.encode(data.toMap());

class ProjectsDetail {
  ProjectsDetail({
    this.id,
    this.name,
    this.description,
    this.createdOn,
    this.status,
    this.customerId,
    this.customerName,
    this.projectCategoryId,
    this.projectCategoryName,
    this.articleDetailList,
  });

  String? id;
  String? name;
  dynamic description;
  DateTime? createdOn;
  String? status;
  String? customerId;
  String? customerName;
  String? projectCategoryId;
  String? projectCategoryName;
  List<ArticleDetailList>? articleDetailList;

  factory ProjectsDetail.fromMap(Map<String, dynamic> json) => ProjectsDetail(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    createdOn: DateTime.parse(json["createdOn"]),
    status: json["status"],
    customerId: json["customerId"],
    customerName: json["customerName"],
    projectCategoryId: json["projectCategoryId"],
    projectCategoryName: json["projectCategoryName"],
    articleDetailList: List<ArticleDetailList>.from(json["articleDetailList"].map((x) => ArticleDetailList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "createdOn": createdOn!.toIso8601String(),
    "status": status,
    "customerId": customerId,
    "customerName": customerName,
    "projectCategoryId": projectCategoryId,
    "projectCategoryName": projectCategoryName,
    "articleDetailList": List<dynamic>.from(articleDetailList!.map((x) => x.toMap())),
  };
}

class ArticleDetailList {
  ArticleDetailList({
    required this.id,
    required this.projectId,
    required this.name,
    required this.projectName,
    required this.categoryName,
    this.auditorName,
    this.translatorName,
    required this.customerId,
    required this.customerName,
    required this.description,
    required this.originalContent,
    required this.translatedContent,
    required this.languageFrom,
    required this.languageTo,
    required this.numberOfWords,
    required this.status,
    this.translatorId,
    this.auditorId,
    required this.fee,
    required this.deadline,
    required this.completedOn,
    this.completedBy,
    this.verifiedOn,
    this.verifiedBy,
    required this.createdOn,
    required this.createdBy,
    this.modifiedOn,
    this.modifiedBy,
  });

  String id;
  String projectId;
  String name;
  String projectName;
  String categoryName;
  dynamic auditorName;
  dynamic translatorName;
  String customerId;
  String customerName;
  String description;
  String originalContent;
  String translatedContent;
  String languageFrom;
  String languageTo;
  int numberOfWords;
  String status;
  dynamic translatorId;
  dynamic auditorId;
  double fee;
  DateTime? deadline;
  DateTime? completedOn;
  dynamic completedBy;
  dynamic verifiedOn;
  dynamic verifiedBy;
  DateTime createdOn;
  String createdBy;
  dynamic modifiedOn;
  dynamic modifiedBy;

  factory ArticleDetailList.fromMap(Map<String, dynamic> json) => ArticleDetailList(
    id: json["id"],
    projectId: json["projectId"],
    name: json["name"],
    projectName: json["projectName"],
    categoryName: json["categoryName"],
    auditorName: json["auditorName"],
    translatorName: json["translatorName"],
    customerId: json["customerId"] == null ? null : json["customerId"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    description: json["description"] == null ? null : json["description"],
    originalContent: json["originalContent"],
    translatedContent: json["translatedContent"] == null ? null : json["translatedContent"],
    languageFrom: json["languageFrom"],
    languageTo: json["languageTo"],
    numberOfWords: json["numberOfWords"],
    status: json["status"],
    translatorId: json["translatorId"],
    auditorId: json["auditorId"],
    fee: json["fee"].toDouble(),
    deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
    completedOn: json["completedOn"] == null ? null : DateTime.parse(json["completedOn"]),
    completedBy: json["completedBy"],
    verifiedOn: json["verifiedOn"],
    verifiedBy: json["verifiedBy"],
    createdOn: DateTime.parse(json["createdOn"]),
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    modifiedOn: json["modifiedOn"],
    modifiedBy: json["modifiedBy"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "projectId": projectId,
    "name": name,
    "projectName": projectName,
    "categoryName": categoryName,
    "auditorName": auditorName,
    "translatorName": translatorName,
    "customerId": customerId == null ? null : customerId,
    "customerName": customerName == null ? null : customerName,
    "description": description == null ? null : description,
    "originalContent": originalContent,
    "translatedContent": translatedContent == null ? null : translatedContent,
    "languageFrom": languageFrom,
    "languageTo": languageTo,
    "numberOfWords": numberOfWords,
    "status": status,
    "translatorId": translatorId,
    "auditorId": auditorId,
    "fee": fee,
    "deadline": deadline == null ? null : deadline?.toIso8601String(),
    "completedOn": completedOn == null ? null : completedOn?.toIso8601String(),
    "completedBy": completedBy,
    "verifiedOn": verifiedOn,
    "verifiedBy": verifiedBy,
    "createdOn": createdOn.toIso8601String(),
    "createdBy": createdBy == null ? null : createdBy,
    "modifiedOn": modifiedOn,
    "modifiedBy": modifiedBy,
  };
}
