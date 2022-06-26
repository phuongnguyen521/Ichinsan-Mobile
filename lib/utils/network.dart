import 'dart:convert';

//http//
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../model/Article/articles.dart';
import '../model/Article/categories.dart';

// List<Articles> parseArticles (String resonseArticle){
//   var list = json.decode(resonseArticle) as List<dynamic>;
//   List<Articles> articles = list.map((model) => Articles.fromJson(model)).toList();
//   return articles;
// }

//Article

List<Articles> parseArticles (String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Articles> articles = list.map((model) => Articles.fromMap(model)).toList();
  return articles;
}

Future<List<Articles>> fetchArticles(int? pageNumber, int pageSize) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.articleEndpoint;
  final response = await http.get(Uri.parse('$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize'));
  //final response = await http.get(Uri.parse('https://api-dotnet-test.herokuapp.com/api/articles?pageNumber=1&pageSize=5'));
  if (response.statusCode == 200) {
    var result = compute(parseArticles, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

/*Future<List<Articles>> fetchArticles() async {
  final response = await http.get(Uri.parse(
      'https://api-dotnet-test.herokuapp.com/api/articles?pageNumber=1&pageSize=5'));
  if (response.statusCode == 200) {
    var result = compute(parseArticles, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}*/

//Category
List<Categories> parseCategories (String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Categories> categories = list.map((model) => Categories.fromMap(model)).toList();
  return categories;
}

Future<List<Categories>> fetchCategories() async {
  final response = await http.get(Uri.parse(
      'https://api-dotnet-test.herokuapp.com/api/projectcategories'));
  if (response.statusCode == 200) {
    var result = compute(parseCategories, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

List<Language> parseLanguage (String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Language> languages = list.map((model) => Language.fromMap(model)).toList();
  return languages;
}

Future<List<Language>> fetchLanguage() async {
  final response = await http.get(Uri.parse(
      'https://api-dotnet-test.herokuapp.com/api/languages'));
  if (response.statusCode == 200) {
    var result = compute(parseLanguage, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}