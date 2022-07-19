import 'dart:convert';
import 'dart:developer';

//http//
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ichinsan_mobile/model/Customer/customer.dart';
import 'package:ichinsan_mobile/model/Project/projectdetail.dart';

import '../constants/api_constants.dart';
import '../model/Article/articles.dart';
import '../model/Article/categories.dart';
import '../model/Project/projects.dart';
import '../model/application/apply_article.dart';

// List<Articles> parseArticles (String resonseArticle){
//   var list = json.decode(resonseArticle) as List<dynamic>;
//   List<Articles> articles = list.map((model) => Articles.fromJson(model)).toList();
//   return articles;
// }

//Article

List<Articles> parseArticles(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Articles> articles =
      list.map((model) => Articles.fromMap(model)).toList();
  return articles;
}

Future<List<Articles>> fetchArticles(int? pageNumber, int pageSize) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.articleEndpoint;
  final response = await http.get(
      Uri.parse('$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize'));
  //final response = await http.get(Uri.parse('https://api-dotnet-test.herokuapp.com/api/articles?pageNumber=1&pageSize=5'));
  if (response.statusCode == 200) {
    var result = compute(parseArticles, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

Future<List<Articles>> fetchArticlesSearch(
    int? pageNumber, int pageSize, String sFilter) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.articleEndpoint;
  final response = await http.get(Uri.parse(
      '$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize&$sFilter'));
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
List<Categories> parseCategories(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Categories> categories =
      list.map((model) => Categories.fromMap(model)).toList();
  return categories;
}

Future<List<Categories>> fetchCategories() async {
  final response = await http.get(
      Uri.parse('https://api-dotnet-test.herokuapp.com/api/projectcategories'));
  if (response.statusCode == 200) {
    var result = compute(parseCategories, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

List<Language> parseLanguage(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Language> languages =
      list.map((model) => Language.fromMap(model)).toList();
  return languages;
}

Future<List<Language>> fetchLanguage() async {
  final response = await http
      .get(Uri.parse('https://api-dotnet-test.herokuapp.com/api/languages'));
  if (response.statusCode == 200) {
    var result = compute(parseLanguage, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

List<Projects> parseProjects(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Projects> projects =
  list.map((model) => Projects.fromMap(model)).toList();
  return projects;
}

Future<List<Projects>> fetchProjects(int? pageNumber, int pageSize) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.projectsEndpoint;
  final response = await http.get(
      Uri.parse('$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize'));
  //final response = await http.get(Uri.parse('https://api-dotnet-test.herokuapp.com/api/projects?pageNumber=1&pageSize=5'));

  if (response.statusCode == 200) {
    var result = compute(parseProjects, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

Future<List<Projects>> fetchProjectsbyID(int? pageNumber, int pageSize,String id) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.projectsEndpoint;
  final response = await http.get(
      Uri.parse('$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize'));
  //final response = await http.get(Uri.parse('https://api-dotnet-test.herokuapp.com/api/projects?pageNumber=1&pageSize=5'));

  if (response.statusCode == 200) {
    var result = compute(parseProjects, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

Future<List<Projects>> fetchProjectwithid(String id) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.projectsEndpoint;
  //final response = await http.get(Uri.parse('$postsEndpoint/$id'));
  final response = await http.get(Uri.parse('https://api-dotnet-test.herokuapp.com/api/projects/$id'));

  if (response.statusCode == 200) {
    var result = compute(parseProjects, response.body);
    return result;
  } else {
    throw Exception("Request API fail");
  }
}

Future<ProjectsDetail?> getProjectDetailbyId(String ID) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.projectsEndpoint;
  try {
    final url = Uri.parse('$postsEndpoint/$ID');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return projectsDetailFromMap(response.body);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<Customer?> getCustomerbyId(String ID) async {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.usersEndpoint;
  try {
    final url = Uri.parse('$postsEndpoint/$ID');
    //final url = Uri.parse('https://api-dotnet-test.herokuapp.com/api/users/abbac12e-27b6-4492-acbb-034ec881bfff');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return customerFromMap(response.body);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<ApplyArticle?> applyArticle(String projectId, String articleId, String appliedBy) async{
  final String postsEndpoint =
  ApiConstants.baseUrl + ApiConstants.applicationsEndpoint;
  final url = Uri.parse('$postsEndpoint');
  //https://api-dotnet-test.herokuapp.com/api/applications
  final response= await http.post(url,
      headers: {
        "Content-Type" : "application/json",
      },
      body :jsonEncode({
        "projectId": projectId,
        "articleId": articleId,
        "appliedBy": appliedBy
      }));

  var data =response.body;
  print(data);

  if(response.statusCode==200){
    String responseString = response.body;
    applyArticleFromMap(responseString);
  }else return null;
}




