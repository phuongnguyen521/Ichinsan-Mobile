import 'dart:convert';
import 'dart:developer';

import 'package:ichinsan_mobile/constants/api_constants.dart';
import 'package:ichinsan_mobile/model/User/user_model.dart';
import 'package:http/http.dart' as http;

class UserClient {
  final String postsEndpoint =
      ApiConstants.baseUrl + ApiConstants.usersEndpoint;

  Future<List<UserModel>?> fetchUser(int? pageNumber, int pageSize) async {
    try {
      final url =
          Uri.parse('$postsEndpoint?pageNumber=$pageNumber&pageSize=$pageSize');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return userModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
