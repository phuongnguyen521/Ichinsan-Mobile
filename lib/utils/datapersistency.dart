import 'package:ichinsan_mobile/model/Account/Account.dart';
import 'package:nb_utils/nb_utils.dart';

class DataPersistency {
  DataPersistency() {}

  static void addAccountToPreferences(Account account, String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String value = accountToJson(account);
    print(value);
    preferences.setString(key, value);
  }

  static void clearAccountPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
    print("Data $key clear");
  }

  static Future<Account?> getPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? value = preferences.getString(key);
    if (value == null) {
      print("There is no value of " + key);
      return null;
    }
    var account = accountFromJson(value);
    return account;
  }
}
