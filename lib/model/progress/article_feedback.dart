import 'dart:convert';

import 'article_feedback_detail.dart';

List<ArticleFeedback> articleFeedbackFromJson(String? str) =>
    List<ArticleFeedback>.from(
        json.decode(str!).map((x) => ArticleFeedback.fromJson(x)));

String? articleFeedbackToJson(List<ArticleFeedback> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleFeedback {
  ArticleFeedback({
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
    this.feedbackList,
  });

  String? id;
  String? projectId;
  String? originalContent;
  String? translatedContent;
  int? languageFromId;
  int? languageToId;
  int? numberOfWords;
  int? status;
  String? translatorId;
  String? auditorId;
  int? fee;
  DateTime? deadline;
  DateTime? completedOn;
  String? completedBy;
  DateTime? verifiedOn;
  String? verifiedBy;
  DateTime? createdOn;
  String? createdBy;
  DateTime? modifiedOn;
  String? modifiedBy;
  String? name;
  String? description;
  List<FeedbackList>? feedbackList;

  ArticleFeedback copyWith({
    String? id,
    String? projectId,
    String? originalContent,
    String? translatedContent,
    int? languageFromId,
    int? languageToId,
    int? numberOfWords,
    int? status,
    String? translatorId,
    String? auditorId,
    int? fee,
    DateTime? deadline,
    DateTime? completedOn,
    String? completedBy,
    DateTime? verifiedOn,
    String? verifiedBy,
    DateTime? createdOn,
    String? createdBy,
    DateTime? modifiedOn,
    String? modifiedBy,
    String? name,
    String? description,
    List<FeedbackList>? feedbackList,
  }) =>
      ArticleFeedback(
        id: id ?? this.id,
        projectId: projectId ?? this.projectId,
        originalContent: originalContent ?? this.originalContent,
        translatedContent: translatedContent ?? this.translatedContent,
        languageFromId: languageFromId ?? this.languageFromId,
        languageToId: languageToId ?? this.languageToId,
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
        name: name ?? this.name,
        description: description ?? this.description,
        feedbackList: feedbackList ?? this.feedbackList,
      );

  factory ArticleFeedback.fromJson(Map<String?, dynamic> json) =>
      ArticleFeedback(
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
        deadline: DateTime?.parse(json["deadline"]),
        completedOn: DateTime?.parse(json["completedOn"]),
        completedBy: json["completedBy"],
        verifiedOn: DateTime?.parse(json["verifiedOn"]),
        verifiedBy: json["verifiedBy"],
        createdOn: DateTime?.parse(json["createdOn"]),
        createdBy: json["createdBy"],
        modifiedOn: DateTime?.parse(json["modifiedOn"]),
        modifiedBy: json["modifiedBy"],
        name: json["name"],
        description: json["description"],
        feedbackList: List<FeedbackList>.from(
            json["feedbackList"].map((x) => FeedbackList.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
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
        "deadline": deadline!.toIso8601String(),
        "completedOn": completedOn!.toIso8601String(),
        "completedBy": completedBy,
        "verifiedOn": verifiedOn!.toIso8601String(),
        "verifiedBy": verifiedBy,
        "createdOn": createdOn!.toIso8601String(),
        "createdBy": createdBy,
        "modifiedOn": modifiedOn!.toIso8601String(),
        "modifiedBy": modifiedBy,
        "name": name,
        "description": description,
        "feedbackList":
            List<dynamic>.from(feedbackList!.map((x) => x.toJson())),
      };
}

class FeedbackList {
  FeedbackList({
    this.id,
    this.projectId,
    this.articleId,
    this.content,
    this.rating,
    this.createdOn,
    this.createdBy,
    this.createdByName,
    this.modifiedOn,
    this.modifiedBy,
    this.status,
    this.feedbackCriteria,
  });

  String? id;
  String? projectId;
  String? articleId;
  String? content;
  int? rating;
  DateTime? createdOn;
  String? createdBy;
  String? createdByName;
  DateTime? modifiedOn;
  String? modifiedBy;
  int? status;
  List<FeedbackCriterion>? feedbackCriteria;

  FeedbackList copyWith(
          {String? id,
          String? projectId,
          String? articleId,
          String? content,
          int? rating,
          DateTime? createdOn,
          String? createdBy,
          String? createdByName,
          DateTime? modifiedOn,
          String? modifiedBy,
          int? status,
          List<FeedbackCriterion>? feedbackCriteria}) =>
      FeedbackList(
          id: id ?? this.id,
          projectId: projectId ?? this.projectId,
          articleId: articleId ?? this.articleId,
          content: content ?? this.content,
          rating: rating ?? this.rating,
          createdOn: createdOn ?? this.createdOn,
          createdByName: createdByName ?? this.createdByName,
          createdBy: createdBy ?? this.createdBy,
          modifiedOn: modifiedOn ?? this.modifiedOn,
          modifiedBy: modifiedBy ?? this.modifiedBy,
          status: status ?? this.status,
          feedbackCriteria: feedbackCriteria ?? this.feedbackCriteria);

  factory FeedbackList.fromJson(Map<String?, dynamic> json) => FeedbackList(
        id: json["id"],
        projectId: json["projectId"],
        articleId: json["articleId"],
        content: json["content"],
        rating: json["rating"],
        createdOn: DateTime?.parse(json["createdOn"]),
        createdBy: json["createdBy"],
        createdByName: json["createdByName"],
        modifiedOn: DateTime?.parse(json["modifiedOn"]),
        modifiedBy: json["modifiedBy"],
        status: json["status"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "projectId": projectId,
        "articleId": articleId,
        "content": content,
        "rating": rating,
        "createdOn": createdOn!.toIso8601String(),
        "createdBy": createdBy,
        "createdByName": createdByName,
        "modifiedOn": modifiedOn!.toIso8601String(),
        "modifiedBy": modifiedBy,
        "status": status,
      };
}
