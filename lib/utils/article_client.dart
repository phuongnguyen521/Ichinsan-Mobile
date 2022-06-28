import 'dart:developer';

import 'package:ichinsan_mobile/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../constants/demoArticles.dart';

class ArticleClient {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.articleEndpoint;

  Future<Articles?> fetchArticles(int? pageNumber, int pageSize) async {
    try {
      final url =
          Uri.parse('$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return articlesFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Articles?> getArticleByID(String? ID) async {
    try {
      final url = Uri.parse('$postsEndpoint/$ID');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return articlesFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
