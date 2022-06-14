import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'articles.dart';


//http//
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

// List<Articles> parseArticles (String resonseArticle){
//   var list = json.decode(resonseArticle) as List<dynamic>;
//   List<Articles> articles = list.map((model) => Articles.fromJson(model)).toList();
//   return articles;
// }

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

class FetchArticles{
  var data = [];
  List<Articles> result =[];
  String fetchurl = "https://raw.githubusercontent.com/midokido28/Article_Json/main/aticles.json?fbclid=IwAR3f2ZvVU6Dqfj-u9sA2kGLEMZgTWyKQyfqdPwFd-0dv8AQDKoFLCLnRjy4";
  Future<List<Articles>> getArticlesList({String? query}) async {
    var url = Uri.parse(fetchurl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      result = data.map((e) => Articles.fromJson(e)).toList();
      if(query != null){
        result = result.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
      }
      return result;
    } else {
      throw Exception("Request API fail");
    }
  }
}
