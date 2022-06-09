import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_networking/constants.dart';

import 'model/post.dart';

class PostClient {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.postsEndpoint;

  Future<Post?> fetchPost(int postId) async {
    try {
      final url = Uri.parse('$postsEndpoint/$postId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return Post.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Post> createPost(String title, String body) async {
    final url = Uri.parse(postsEndpoint);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'title': title, 'body': body}),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future<Post> updatePost(int postId, String title, String body) async {
    final url = Uri.parse("$postsEndpoint/$postId");
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {'title': title, 'body': body},
        ));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw new Exception('Failed to update post');
    }
  }

  Future<Post> deletePost(int postId) async {
    final url = Uri.parse("$postsEndpoint/$postId");
    final response = await http.delete(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete post: $postId');
    }
  }
}
