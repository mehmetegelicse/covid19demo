import 'package:covid19demo/models/country_model.dart';
import 'package:covid19demo/models/country_response_model.dart';
import 'package:covid19demo/service/api_service.dart';
import 'package:covid19demo/views/country_detail_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentCountry = CountryModel().obs;
  var isLoading = true.obs;
  var data = CountryResponse(response: []).obs;

  final _apiService = ApiService();

  void getCountryList() async {
    try {
      isLoading(true);
      var countryResponse =
          await _apiService.fetchCountryList() as CountryResponse;
      if (countryResponse.response.isNotEmpty) {
        data.value.response.assignAll(countryResponse.response);
        isLoading(false);
        print(data.value.response[0]);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCountryList();
    super.onInit();
  }

  void onItemClick(String countryName) async {
    currentCountry.value = await _apiService.getCountryStatistics(countryName);
    var a = currentCountry.value;
    Get.to(() => CountryDetailView(countryModel: a));
  }
}
