import 'dart:convert';

List<TranslatorApplication> translatorApplicationFromJson(String? str) =>
    List<TranslatorApplication>.from(
        json.decode(str!).map((x) => TranslatorApplication.fromJson(x)));

String? translatorApplicationToJson(List<TranslatorApplication> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TranslatorApplication {
  TranslatorApplication({
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
  int? salary;
  String? languageFromName;
  String? languageToName;

  TranslatorApplication copyWith({
    String? id,
    String? profileId,
    String? projectId,
    String? articleId,
    String? applyBy,
    String? appliedBy,
    DateTime? appliedOn,
    String? status,
    String? articleName,
    int? salary,
    String? languageFromName,
    String? languageToName,
  }) =>
      TranslatorApplication(
        id: id ?? this.id,
        profileId: profileId ?? this.profileId,
        projectId: projectId ?? this.projectId,
        articleId: articleId ?? this.articleId,
        applyBy: applyBy ?? this.applyBy,
        appliedBy: appliedBy ?? this.appliedBy,
        appliedOn: appliedOn ?? this.appliedOn,
        status: status ?? this.status,
        articleName: articleName ?? this.articleName,
        salary: salary ?? this.salary,
        languageFromName: languageFromName ?? this.languageFromName,
        languageToName: languageToName ?? this.languageToName,
      );

  factory TranslatorApplication.fromJson(Map<String?, dynamic> json) =>
      TranslatorApplication(
        id: json["id"],
        profileId: json["profileId"],
        projectId: json["projectId"],
        articleId: json["articleId"],
        applyBy: json["applyBy"],
        appliedBy: json["appliedBy"],
        appliedOn: DateTime?.parse(json["appliedOn"]),
        status: json["status"],
        articleName: json["articleName"],
        salary: json["salary"],
        languageFromName: json["languageFromName"],
        languageToName: json["languageToName"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "profileId": profileId,
        "projectId": projectId,
        "articleId": articleId,
        "applyBy": applyBy,
        "appliedBy": appliedBy,
        "appliedOn": appliedOn!.toIso8601String(),
        "status": status,
        "articleName": articleName,
        "salary": salary,
        "languageFromName": languageFromName,
        "languageToName": languageToName,
      };
}
