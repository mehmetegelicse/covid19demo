import 'package:covid19demo/models/country_model.dart';
import 'package:covid19demo/models/country_response_model.dart';
import 'package:covid19demo/service/api_service.dart';
import 'package:covid19demo/views/country_detail_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentCountry = CountryModel().obs;
  var searchView = false.obs;
  var searchItems = [].obs;
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
    isLoading(true);
    try {
      currentCountry.value =
          await _apiService.getCountryStatistics(countryName);
    } finally {
      if (currentCountry.value.response != null) {
        closeSearchResult();
        Get.to(() => CountryDetailView(countryModel: currentCountry.value));
      }
      isLoading(false);
    }
  }

  showSearchResults(String value) {
    List<String> temp = [];
    if (value.isNotEmpty) {
      searchView(true);
      data.value.response.forEach((element) {
        if (element.toLowerCase().contains(value.toLowerCase())) {
          temp.add(element);
        }
      });
    } else {
      closeSearchResult();
    }
    searchItems.value = temp;
  }

  closeSearchResult() {
    searchView(false);
    searchItems.clear();
  }
}
