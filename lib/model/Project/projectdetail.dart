// To parse this JSON data, do
//
//     final projectsDetail = projectsDetailFromMap(jsonString);

import 'dart:convert';

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
  });

  String? id;
  String? name;
  String? description;
  DateTime? createdOn;
  String? status;
  dynamic customerId;
  dynamic customerName;
  String? projectCategoryId;
  String? projectCategoryName;

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
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "createdOn": createdOn?.toIso8601String(),
    "status": status,
    "customerId": customerId,
    "customerName": customerName,
    "projectCategoryId": projectCategoryId,
    "projectCategoryName": projectCategoryName,
  };
}
