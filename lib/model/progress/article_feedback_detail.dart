import 'dart:convert';

FeedbackDetail feedbackDetailFromJson(String? str) =>
    FeedbackDetail.fromJson(json.decode(str!));

String? feedbackDetailToJson(FeedbackDetail data) => json.encode(data.toJson());

class FeedbackDetail {
  FeedbackDetail({
    this.id,
    this.feedbackCriteria,
  });

  String? id;
  List<FeedbackCriterion>? feedbackCriteria;

  FeedbackDetail copyWith({
    String? id,
    List<FeedbackCriterion>? feedbackCriteria,
  }) =>
      FeedbackDetail(
        id: id ?? this.id,
        feedbackCriteria: feedbackCriteria ?? this.feedbackCriteria,
      );

  factory FeedbackDetail.fromJson(Map<String?, dynamic> json) => FeedbackDetail(
        id: json["id"],
        feedbackCriteria: List<FeedbackCriterion>.from(json["feedbackCriteria"]!
            .map((x) => FeedbackCriterion.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "feedbackCriteria":
            List<dynamic>.from(feedbackCriteria!.map((x) => x.toJson())),
      };
}

class FeedbackCriterion {
  FeedbackCriterion({
    this.id,
    this.feedbackId,
    this.feedbackCategoryId,
    this.createdOn,
    this.createdBy,
    this.modifiedOn,
    this.modifiedBy,
    this.feedback,
    this.feedbackCategory,
  });

  String? id;
  String? feedbackId;
  int? feedbackCategoryId;
  DateTime? createdOn;
  String? createdBy;
  DateTime? modifiedOn;
  String? modifiedBy;
  String? feedback;
  FeedbackCategory? feedbackCategory;

  FeedbackCriterion copyWith({
    String? id,
    String? feedbackId,
    int? feedbackCategoryId,
    DateTime? createdOn,
    String? createdBy,
    DateTime? modifiedOn,
    String? modifiedBy,
    String? feedback,
    FeedbackCategory? feedbackCategory,
  }) =>
      FeedbackCriterion(
        id: id ?? this.id,
        feedbackId: feedbackId ?? this.feedbackId,
        feedbackCategoryId: feedbackCategoryId ?? this.feedbackCategoryId,
        createdOn: createdOn ?? this.createdOn,
        createdBy: createdBy ?? this.createdBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        feedback: feedback ?? this.feedback,
        feedbackCategory: feedbackCategory ?? this.feedbackCategory,
      );

  factory FeedbackCriterion.fromJson(Map<String?, dynamic> json) =>
      FeedbackCriterion(
        id: json["id"],
        feedbackId: json["feedbackId"],
        feedbackCategoryId: json["feedbackCategoryId"],
        createdOn: DateTime?.parse(json["createdOn"]),
        createdBy: json["createdBy"],
        modifiedOn: DateTime?.parse(json["modifiedOn"]),
        modifiedBy: json["modifiedBy"],
        feedback: json["feedback"],
        feedbackCategory: FeedbackCategory.fromJson(json["feedbackCategory"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "feedbackId": feedbackId,
        "feedbackCategoryId": feedbackCategoryId,
        "createdOn": createdOn!.toIso8601String(),
        "createdBy": createdBy,
        "modifiedOn": modifiedOn!.toIso8601String(),
        "modifiedBy": modifiedBy,
        "feedback": feedback,
        "feedbackCategory": feedbackCategory!.toJson(),
      };
}

class FeedbackCategory {
  FeedbackCategory({
    this.id,
    this.code,
    this.name,
    this.description,
    this.isActive,
    this.createdOn,
    this.createdBy,
    this.modifiedOn,
    this.modifiedBy,
    this.feedbackCriteria,
  });

  int? id;
  String? code;
  String? name;
  String? description;
  bool? isActive;
  DateTime? createdOn;
  String? createdBy;
  DateTime? modifiedOn;
  String? modifiedBy;
  List<String>? feedbackCriteria;

  FeedbackCategory copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    bool? isActive,
    DateTime? createdOn,
    String? createdBy,
    DateTime? modifiedOn,
    String? modifiedBy,
    List<String>? feedbackCriteria,
  }) =>
      FeedbackCategory(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
        createdOn: createdOn ?? this.createdOn,
        createdBy: createdBy ?? this.createdBy,
        modifiedOn: modifiedOn ?? this.modifiedOn,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        feedbackCriteria: feedbackCriteria ?? this.feedbackCriteria,
      );

  factory FeedbackCategory.fromJson(Map<String?, dynamic> json) =>
      FeedbackCategory(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        createdOn: DateTime?.parse(json["createdOn"]),
        createdBy: json["createdBy"],
        modifiedOn: DateTime?.parse(json["modifiedOn"]),
        modifiedBy: json["modifiedBy"],
        feedbackCriteria:
            List<String>.from(json["feedbackCriteria"]!.map((x) => x)),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "description": description,
        "isActive": isActive,
        "createdOn": createdOn!.toIso8601String(),
        "createdBy": createdBy,
        "modifiedOn": modifiedOn!.toIso8601String(),
        "modifiedBy": modifiedBy,
        "feedbackCriteria": List<dynamic>.from(feedbackCriteria!.map((x) => x)),
      };
}
