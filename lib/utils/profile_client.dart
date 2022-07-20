import 'dart:convert';
import 'dart:io';

import 'package:gallery_saver/files.dart';
import 'package:ichinsan_mobile/constants/Ichinsan_string.dart';
import 'package:ichinsan_mobile/constants/api_constants.dart';
import 'package:ichinsan_mobile/model/Account/Account.dart';
import 'package:http/http.dart' as http;
import 'package:ichinsan_mobile/model/account/new_account.dart';
import 'package:ichinsan_mobile/model/profile/Ichinsanprofile.dart';
import 'package:ichinsan_mobile/utils/datapersistency.dart';
import 'package:nb_utils/nb_utils.dart';

final String profileEndpoint =
    ApiConstants.baseUrl + ApiConstants.profileEndpoint;

Future<IchinsanProfile> getProfile(String id) async {
  var profile = null;
  try {
    final url = Uri.parse('$profileEndpoint/$id');
    final response = await http.get(url);
    if (response.statusCode.isSuccessful()) {
      profile = ichinsanProfileFromJson(response.body)[0];
      return profile;
    } else {
      return profile;
    }
  } catch (e) {
    log(e.toString());
  }
  return profile;
}
