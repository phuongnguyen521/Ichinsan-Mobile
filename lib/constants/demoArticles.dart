import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Articles({
    this.id,
    this.projectId,
    this.originalContent,
    this.translatedContent,
    this.languageFromId,
    this.languageToId,
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
    this.name,
    this.description,
    this.auditor,
    this.project,
    this.translator,
    this.applications,
    this.feedbacks,
  });

  String? id;
  String? projectId;
  String? originalContent;
  dynamic? translatedContent;
  int? languageFromId;
  int? languageToId;
  int? numberOfWords;
  int? status;
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
  String? name;
  String? description;
  dynamic auditor;
  dynamic project;
  dynamic translator;
  List<dynamic>? applications;
  List<dynamic>? feedbacks;

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        id: json["id"],
        projectId: json["projectId"],
        originalContent: json["originalContent"],
        translatedContent: json["translatedContent"],
        languageFromId: json["languageFromId"],
        languageToId: json["languageToId"],
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
        name: json["name"],
        description: json["description"],
        auditor: json["auditor"],
        project: json["project"],
        translator: json["translator"],
        applications: List<dynamic>.from(json["applications"].map((x) => x)),
        feedbacks: List<dynamic>.from(json["feedbacks"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "projectId": projectId,
        "originalContent": originalContent,
        "translatedContent": translatedContent,
        "languageFromId": languageFromId,
        "languageToId": languageToId,
        "numberOfWords": numberOfWords,
        "status": status,
        "translatorId": translatorId,
        "auditorId": auditorId,
        "fee": fee,
        "deadline": deadline?.toIso8601String(),
        "completedOn": completedOn,
        "completedBy": completedBy,
        "verifiedOn": verifiedOn,
        "verifiedBy": verifiedBy,
        "createdOn": createdOn?.toIso8601String(),
        "createdBy": createdBy,
        "modifiedOn": modifiedOn,
        "modifiedBy": modifiedBy,
        "name": name,
        "description": description,
        "auditor": auditor,
        "project": project,
        "translator": translator,
        "applications": List<dynamic>.from(applications!.map((x) => x)),
        "feedbacks": List<dynamic>.from(feedbacks!.map((x) => x)),
      };
}
