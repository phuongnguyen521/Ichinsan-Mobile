import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'articles.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/foundation.dart';

// List<Articles> parseArticles (String resonseArticle){
//   var list = json.decode(resonseArticle) as List<dynamic>;
//   List<Articles> articles = list.map((model) => Articles.fromJson(model)).toList();
//   return articles;
// }

Future<List<Articles>> ReadData() async {
  final response = await rootBundle.rootBundle.loadString('jsonfile/aticles.json');

  final list = json.decode(response) as List<dynamic>;
  if(list.isNotEmpty)
  return list.map((e) => Articles.fromJson(e)).toList();
  else{
    throw Exception("Not Found");
  }
}