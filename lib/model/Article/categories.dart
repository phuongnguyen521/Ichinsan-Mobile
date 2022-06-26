// To parse this JSON data, do
//
//     final categories = categoriesFromMap(jsonString);

import 'dart:convert';

List<Categories> categoriesFromMap(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromMap(x)));

String categoriesToMap(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Categories {
  Categories({
    this.id,
    this.code,
    this.name,
    this.description,
  });

  String? id;
  String? code;
  String? name;
  String? description;

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
  };
}


List<Language> languageFromMap(String str) => List<Language>.from(json.decode(str).map((x) => Language.fromMap(x)));

String languageToMap(List<Language> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Language {
  Language({
    this.id,
    this.code,
    this.name,
    this.isActive,
  });

  int? id;
  String? code;
  String? name;
  bool? isActive;

  factory Language.fromMap(Map<String, dynamic> json) => Language(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "code": code,
    "name": name,
    "isActive": isActive,
  };
}
