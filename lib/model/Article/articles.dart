// To parse this JSON data, do
//
//     final articles = articlesFromMap(jsonString);

import 'dart:convert';

List<Articles> articlesFromMap(String? str) =>
    List<Articles>.from(json.decode(str!).map((x) => Articles.fromMap(x)));

Articles articlesFromJson(String? str) => Articles.fromJson(json.decode(str!));

String? articlesToMap(List<Articles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Articles {
  Articles({
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
  String? auditorName;
  String? translatorName;
  String? customerId;
  String? customerName;
  String? description;
  String? originalContent;
  String? translatedContent;
  String? languageFrom;
  String? languageTo;
  int? numberOfWords;
  String? status;
  String? translatorId;
  String? auditorId;
  double? fee;
  DateTime? deadline;
  DateTime? completedOn;
  String? completedBy;
  DateTime? verifiedOn;
  String? verifiedBy;
  DateTime? createdOn;
  String? createdBy;
  DateTime? modifiedOn;
  String? modifiedBy;

  factory Articles.fromMap(Map<String?, dynamic> json) => Articles(
        id: json["id"] == null ? null : json["id"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        name: json["name"] == null ? null : json["name"],
        projectName: json["projectName"] == null ? null : json["projectName"],
        categoryName:
            json["categoryName"] == null ? null : json["categoryName"],
        auditorName: json["auditorName"] == null ? null : json["auditorName"],
        translatorName:
            json["translatorName"] == null ? null : json["translatorName"],
        customerId: json["customerId"] == null ? null : json["customerId"],
        customerName:
            json["customerName"] == null ? null : json["customerName"],
        description: json["description"] == null ? null : json["description"],
        originalContent:
            json["originalContent"] == null ? null : json["originalContent"],
        translatedContent: json["translatedContent"] == null
            ? null
            : json["translatedContent"],
        languageFrom:
            json["languageFrom"] == null ? null : json["languageFrom"],
        languageTo: json["languageTo"] == null ? null : json["languageTo"],
        numberOfWords:
            json["numberOfWords"] == null ? null : json["numberOfWords"],
        status: json["status"] == null ? null : json["status"],
        translatorId:
            json["translatorId"] == null ? null : json["translatorId"],
        auditorId: json["auditorId"] == null ? null : json["auditorId"],
        fee: json["fee"] == null ? null : json["fee"].toDouble(),
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        completedOn: json["completedOn"] == null
            ? null
            : DateTime.parse(json["completedOn"]),
        completedBy: json["completedBy"] == null ? null : json["completedBy"],
        verifiedOn: json["verifiedOn"] == null
            ? null
            : DateTime.parse(json["verifiedOn"]),
        verifiedBy: json["verifiedBy"] == null ? null : json["verifiedBy"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        modifiedOn: json["modifiedOn"] == null
            ? null
            : DateTime.parse(json["modifiedOn"]),
        modifiedBy: json["modifiedBy"],
      );

  factory Articles.fromJson(Map<String?, dynamic> json) => Articles(
        id: json["id"] == null ? null : json["id"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        name: json["name"] == null ? null : json["name"],
        projectName: json["projectName"] == null ? null : json["projectName"],
        categoryName:
            json["categoryName"] == null ? null : json["categoryName"],
        auditorName: json["auditorName"] == null ? null : json["auditorName"],
        translatorName:
            json["translatorName"] == null ? null : json["translatorName"],
        customerId: json["customerId"] == null ? null : json["customerId"],
        customerName:
            json["customerName"] == null ? null : json["customerName"],
        description: json["description"] == null ? null : json["description"],
        originalContent: json["originalContent"],
        translatedContent: json["translatedContent"] == null
            ? null
            : json["translatedContent"],
        languageFrom:
            json["languageFrom"] == null ? null : json["languageFrom"],
        languageTo: json["languageTo"] == null ? null : json["languageTo"],
        numberOfWords:
            json["numberOfWords"] == null ? null : json["numberOfWords"],
        status: json["status"] == null ? null : json["status"],
        translatorId:
            json["translatorId"] == null ? null : json["translatorId"],
        auditorId: json["auditorId"] == null ? null : json["auditorId"],
        fee: json["fee"] == null ? null : json["fee"].toDouble(),
        deadline:
            json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
        completedOn: json["completedOn"] == null
            ? null
            : DateTime.parse(json["completedOn"]),
        completedBy: json["completedBy"] == null ? null : json["completedBy"],
        verifiedOn: json["verifiedOn"] == null
            ? null
            : DateTime.parse(json["verifiedOn"]),
        verifiedBy: json["verifiedBy"] == null ? null : json["verifiedBy"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        modifiedOn: json["modifiedOn"] == null
            ? null
            : DateTime.parse(json["modifiedOn"]),
        modifiedBy: json["modifiedBy"],
      );

  Map<String?, dynamic> toMap() => {
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
        "translatedContent":
            translatedContent == null ? null : translatedContent,
        "languageFrom": languageFrom,
        "languageTo": languageTo,
        "numberOfWords": numberOfWords,
        "status": status,
        "translatorId": translatorId,
        "auditorId": auditorId,
        "fee": fee,
        "deadline": deadline == null ? null : deadline?.toIso8601String(),
        "completedOn":
            completedOn == null ? null : completedOn?.toIso8601String(),
        "completedBy": completedBy,
        "verifiedOn": verifiedOn,
        "verifiedBy": verifiedBy,
        "createdOn": createdOn!.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "modifiedOn": modifiedOn,
        "modifiedBy": modifiedBy,
      };
}
