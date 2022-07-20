// To parse this JSON data, do
//
//     final applyArticle = applyArticleFromMap(jsonString);

import 'dart:convert';

ApplyArticle applyArticleFromMap(String str) => ApplyArticle.fromMap(json.decode(str));

String applyArticleToMap(ApplyArticle data) => json.encode(data.toMap());

class ApplyArticle {
  ApplyArticle({
    required this.projectId,
    required this.articleId,
    required this.appliedBy,
  });

  String projectId;
  String articleId;
  String appliedBy;

  factory ApplyArticle.fromMap(Map<String, dynamic> json) => ApplyArticle(
    projectId: json["projectId"],
    articleId: json["articleId"],
    appliedBy: json["appliedBy"],
  );

  Map<String, dynamic> toMap() => {
    "projectId": projectId,
    "articleId": articleId,
    "appliedBy": appliedBy,
  };
}
