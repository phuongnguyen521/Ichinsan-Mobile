import '../constants/api_constants.dart';
import '../model/application/translator_application.dart';
import 'package:http/http.dart' as http;

Future<List<TranslatorApplication>?> getApplicationsByUserId(
    int? pageNumber, int pageSize, String userId) async {
  final String articleFeedbackEndpoint = ApiConstants.baseUrl +
      ApiConstants.applicationsEndpoint +
      ApiConstants.applicationsTranslatorEndpoint;
  try {
    final url = Uri.parse(
        '$articleFeedbackEndpoint?applyBy=$userId&pageNumber=$pageNumber&pageSize=$pageSize');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var list = translatorApplicationFromJson(response.body);
      return list;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
