// To parse this JSON data, do
//
//     final customer = customerFromMap(jsonString);

import 'dart:convert';

Customer customerFromMap(String str) => Customer.fromMap(json.decode(str));

String customerToMap(Customer data) => json.encode(data.toMap());

class Customer {
  Customer({
    this.id,
    this.email,
    this.profileId,
    this.balance,
    this.role,
    this.projectList,
  });

  String? id;
  String? email;
  String? profileId;
  double? balance;
  String? role;
  List<ProjectList>? projectList;

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
    id: json["id"],
    email: json["email"],
    profileId: json["profileId"],
    balance: json["balance"],
    role: json["role"],
    projectList: List<ProjectList>.from(json["projectList"].map((x) => ProjectList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "profileId": profileId,
    "balance": balance,
    "role": role,
    "projectList": List<dynamic>.from(projectList!.map((x) => x.toMap())),
  };
}

class ProjectList {
  ProjectList({
    this.projectId,
    this.projectName,
    this.description,
    this.createdOn,
    this.status,
    this.customerId,
    this.customerName,
    this.projectCategoryId,
    this.projectCategoryName,
    this.currentTranslatorNumber,
    this.totalTranslator,
  });

  String? projectId;
  String? projectName;
  dynamic description;
  DateTime? createdOn;
  String? status;
  String? customerId;
  String? customerName;
  String? projectCategoryId;
  String? projectCategoryName;
  int? currentTranslatorNumber;
  int? totalTranslator;

  factory ProjectList.fromMap(Map<String, dynamic> json) => ProjectList(
    projectId: json["projectId"],
    projectName: json["projectName"],
    description: json["description"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    status: json["status"],
    customerId: json["customerId"] == null ? null : json["customerId"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    projectCategoryId: json["projectCategoryId"],
    projectCategoryName: json["projectCategoryName"],
    currentTranslatorNumber: json["currentTranslatorNumber"],
    totalTranslator: json["totalTranslator"],
  );

  Map<String, dynamic> toMap() => {
    "projectId": projectId,
    "projectName": projectName,
    "description": description,
    "createdOn": createdOn == null ? null : createdOn!.toIso8601String(),
    "status": status,
    "customerId": customerId == null ? null : customerId,
    "customerName": customerName == null ? null : customerName,
    "projectCategoryId": projectCategoryId,
    "projectCategoryName": projectCategoryName,
    "currentTranslatorNumber": currentTranslatorNumber,
    "totalTranslator": totalTranslator,
  };
}
