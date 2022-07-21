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
  double? salary;
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
    double? salary,
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

  factory TranslatorApplication.fromJson(Map<String, dynamic> json) =>
      TranslatorApplication(
        id: json["id"] == null ? null : json["id"],
        profileId: json["profileId"] == null ? "" : json["profileId"],
        projectId: json["projectId"] == null ? null : json["projectId"],
        articleId: json["articleId"] == null ? null : json["articleId"],
        applyBy: json["applyBy"] == null ? null : json["applyBy"],
        appliedBy: json["appliedBy"] == null ? null : json["appliedBy"],
        appliedOn: json["appliedOn"] == null
            ? null
            : DateTime.parse(json["appliedOn"]),
        status: json["status"] == null ? null : json["status"],
        articleName: json["articleName"] == null ? null : json["articleName"],
        salary: json["salary"] == null ? null : json["salary"].toDouble(),
        languageFromName:
            json["languageFromName"] == null ? null : json["languageFromName"],
        languageToName:
            json["languageToName"] == null ? null : json["languageToName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "profileId": profileId,
        "projectId": projectId == null ? null : projectId,
        "articleId": articleId == null ? null : articleId,
        "applyBy": applyBy == null ? null : applyBy,
        "appliedBy": appliedBy == null ? null : appliedBy,
        "appliedOn": appliedOn,
        "status": status == null ? null : status,
        "articleName": articleName == null ? null : articleName,
        "salary": salary == null ? null : salary,
        "languageFromName": languageFromName == null ? null : languageFromName,
        "languageToName": languageToName == null ? null : languageToName,
      };
}
