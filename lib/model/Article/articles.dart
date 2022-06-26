// To parse this JSON data, do
//
//     final articles = articlesFromMap(jsonString);

import 'dart:convert';

List<Articles> articlesFromMap(String str) => List<Articles>.from(json.decode(str).map((x) => Articles.fromMap(x)));

String articlesToMap(List<Articles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Articles {
  Articles({
    required this.id,
    required this.projectId,
    required this.projectCategoryName,
    required this.name,
    required this.projectName,
    required this.categoryName,
    required this.auditorName,
    required this.translatorName,
    required this.customerId,
    required this.customerName,
    required this.description,
    required this.originalContent,
    required this.translatedContent,
    required this.languageFrom,
    required this.languageTo,
    required this.numberOfWords,
    required this.status,
    required this.translatorId,
    required this.auditorId,
    required this.fee,
    required this.deadline,
    required this.completedOn,
    required this.completedBy,
    required this.verifiedOn,
    required this.verifiedBy,
    required this.createdOn,
    required this.createdBy,
    required this.modifiedOn,
    required this.modifiedBy,
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
  int? numberOfWords;
  int? status;
  String translatorId;
  String auditorId;
  double fee;
  dynamic deadline;
  DateTime? completedOn;
  dynamic completedBy;
  dynamic verifiedOn;
  dynamic verifiedBy;
  DateTime? createdOn;
  dynamic createdBy;
  dynamic modifiedOn;
  dynamic modifiedBy;

  factory Articles.fromMap(Map<String, dynamic> json) => Articles(
    id: json["id"],
    projectId: json["projectId"] == null ? null : json["projectId"],
    projectCategoryName: json["projectCategoryName"],
    name: json["name"] ,
    projectName: json["projectName"] == null ? null : json["projectName"],
    categoryName: json["categoryName"] == null ? null : json["categoryName"],
    auditorName: json["auditorName"] == null ? null : json["auditorName"],
    translatorName: json["translatorName"] == null ? null : json["translatorName"],
    customerId: json["customerId"],
    customerName: json["customerName"],
    description: json["description"],
    originalContent: json["originalContent"] == null ? null : json["originalContent"],
    translatedContent: json["translatedContent"] == null ? null : json["translatedContent"],
    languageFrom: json["languageFrom"] == null ? null : json["languageFrom"],
    languageTo: json["languageTo"] == null ? null : json["languageTo"],
    numberOfWords: json["numberOfWords"] == null ? null : json["numberOfWords"],
    status: json["status"] == null ? null : json["status"],
    translatorId: json["translatorId"] == null ? null : json["translatorId"],
    auditorId: json["auditorId"] == null ? null : json["auditorId"],
    fee: json["fee"] == null ? null : json["fee"],
    deadline: json["deadline"],
    completedOn: json["completedOn"] == null ? null : DateTime.parse(json["completedOn"]),
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
    "projectId": projectId == null ? null : projectId,
    "projectCategoryName": projectCategoryName,
    "name": name,
    "projectName": projectName == null ? null : projectName,
    "categoryName": categoryName == null ? null : categoryName,
    "auditorName": auditorName == null ? null : auditorName,
    "translatorName": translatorName == null ? null : translatorName,
    "customerId": customerId,
    "customerName": customerName,
    "description": description,
    "originalContent": originalContent == null ? null : originalContent,
    "translatedContent": translatedContent == null ? null : translatedContent,
    "languageFrom": languageFrom == null ? null : languageFrom,
    "languageTo": languageTo == null ? null : languageTo,
    "numberOfWords": numberOfWords == null ? null : numberOfWords,
    "status": status == null ? null : status,
    "translatorId": translatorId == null ? null : translatorId,
    "auditorId": auditorId == null ? null : auditorId,
    "fee": fee == null ? null : fee,
    "deadline": deadline,
    "completedOn": completedOn == null ? null : completedOn?.toIso8601String(),
    "completedBy": completedBy,
    "verifiedOn": verifiedOn,
    "verifiedBy": verifiedBy,
    "createdOn": createdOn?.toIso8601String(),
    "createdBy": createdBy,
    "modifiedOn": modifiedOn,
    "modifiedBy": modifiedBy,
  };
}
