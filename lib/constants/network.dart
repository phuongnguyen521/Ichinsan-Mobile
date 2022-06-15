import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ichinsan_mobile/widgets/Search_Page/categories.dart';
import 'articles.dart';


//http//
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

// List<Articles> parseArticles (String resonseArticle){
//   var list = json.decode(resonseArticle) as List<dynamic>;
//   List<Articles> articles = list.map((model) => Articles.fromJson(model)).toList();
//   return articles;
// }

//Article
List<Articles> parseArticles (String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Articles> articles = list.map((model) => Articles.fromJson(model)).toList();
  return articles;
}

Future<List<Articles>> fetchArticles() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/midokido28/Article_Json/main/aticles.json?fbclid=IwAR3f2ZvVU6Dqfj-u9sA2kGLEMZgTWyKQyfqdPwFd-0dv8AQDKoFLCLnRjy4'));
  if (response.statusCode == 200) {
    var result = compute(parseArticles, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

//Category
List<Categories> parseCategories (String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Categories> categories = list.map((model) => Categories.fromJson(model)).toList();
  return categories;
}

Future<List<Categories>> fetchCategories() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/midokido28/Article_Json/main/category.json'));
  if (response.statusCode == 200) {
    var result = compute(parseCategories, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

List<Language> parseLanguage (String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Language> languages = list.map((model) => Language.fromJson(model)).toList();
  return languages;
}

Future<List<Language>> fetchLanguage() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/midokido28/Article_Json/main/language.json'));
  if (response.statusCode == 200) {
    var result = compute(parseLanguage, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}