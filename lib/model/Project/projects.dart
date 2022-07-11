// To parse this JSON data, do
//
//     final projects = projectsFromMap(jsonString);

import 'dart:convert';

List<Projects> projectsFromMap(String str) => List<Projects>.from(json.decode(str).map((x) => Projects.fromMap(x)));


String projectsToMap(List<Projects> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Projects {
  Projects({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.categoryName,
    required this.currentTranslatorNumber,
    required this.totalTranslator,
  });

  String id;
  String name;
  String description;
  String status;
  String categoryName;
  int currentTranslatorNumber;
  int totalTranslator;

  factory Projects.fromMap(Map<String, dynamic> json) => Projects(
    id: json["id"],
    name: json["name"],
    description: json["description"] == null ? null : json["description"],
    status: json["status"] == null ? null : json["status"],
    categoryName: json["categoryName"],
    currentTranslatorNumber: json["currentTranslatorNumber"],
    totalTranslator: json["totalTranslator"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description == null ? null : description,
    "status": status == null ? null : status,
    "categoryName": categoryName,
    "currentTranslatorNumber": currentTranslatorNumber,
    "totalTranslator": totalTranslator,
  };
}
