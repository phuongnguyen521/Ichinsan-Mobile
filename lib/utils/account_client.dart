import 'dart:convert';
import 'dart:io';

import 'package:gallery_saver/files.dart';
import 'package:ichinsan_mobile/constants/Ichinsan_string.dart';
import 'package:ichinsan_mobile/constants/api_constants.dart';
import 'package:ichinsan_mobile/model/Account/Account.dart';
import 'package:http/http.dart' as http;
import 'package:ichinsan_mobile/model/account/new_account.dart';
import 'package:ichinsan_mobile/utils/datapersistency.dart';
import 'package:nb_utils/nb_utils.dart';

final String accountClientEndpoint =
    ApiConstants.baseUrl + ApiConstants.accountEndpoint;

Future<Account?> Ichinsanlogin(String email) async {
  String loginEndpoint =
      accountClientEndpoint + ApiConstants.accountLoginEndpoint;
  try {
    final url = Uri.parse(loginEndpoint);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );
    if (response.statusCode.isSuccessful() &&
        !response.body.contains('User is not existed')) {
      var account = accountFromJson(response.body);
      DataPersistency.addAccountToPreferences(
          account, Ichinsan_account_preference);
      return account;
    } else {
      return null;
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<bool> Ichinsanregister(NewAccount _newAccount) async {
  var result = false;
  String registerEndpoint =
      accountClientEndpoint + ApiConstants.accountRegisterEndpoint;
  try {
    final url = Uri.parse(registerEndpoint);
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        "email": _newAccount.email,
        "fullName": _newAccount.fullName,
        "phoneNumber": _newAccount.phoneNumber,
        "dob": _newAccount.dob!.toIso8601String(),
        "gender": _newAccount.gender,
        "website": _newAccount.website,
        "role": _newAccount.role
      }),
    );
    if (response.statusCode.isSuccessful()) {
      return result = true;
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
