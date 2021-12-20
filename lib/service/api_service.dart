import '../constants/api_constants.dart';
import '../models/country_model.dart';
import '../models/country_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _apiService = ApiService._internal();
  factory ApiService() {
    return _apiService;
  }
  ApiService._internal();

  static var header = {
    AppConstants.API_HOST_NAME: AppConstants.API_HOST,
    AppConstants.API_KEY_NAME: AppConstants.API_KEY
  };
  Future<dynamic> fetchCountryList() async {
    var url = Uri.https(AppConstants.BASE_URL, AppConstants.COUNTRY_LIST);
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var jasonString = response.body;
      return countryResponseFromJson(jasonString);
    } else {
      return null;
    }
  }

  Future<dynamic> getCountryStatistics(String countryName) async {
    var queryParams = {"country": countryName};
    final url =
        Uri.https(AppConstants.BASE_URL, AppConstants.STATISTICS, queryParams);
    var response = await http.get(
      url,
      headers: header,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return countryModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
