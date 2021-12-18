import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstants {
  //API Service constants
  static String BASE_URL = "covid-193.p.rapidapi.com";
  static String COUNTRY_LIST = "countries";
  static String STATISTICS = "statistics/";
  static String API_KEY = "7230f0073fmsh19c10074c514c59p16793ejsn6aa0e35fe867";
  static String API_KEY_NAME = "x-rapidapi-key";
  static String API_HOST_NAME = "x-rapidapi-host";
  static String API_HOST = "covid-193.p.rapidapi.com";

  //UI Constants

  static EdgeInsets padding = const EdgeInsets.all(8);
  static Color caseColor = Colors.blue.shade200;
  static Color deathColor = Colors.red.shade200;
  static Color testColor = Colors.green.shade200;

  static Text titleText(String title) => Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      );

  static NumberFormat formatter = NumberFormat('###,###,###,###');
  static String convertTypes<T>(T param) {
    if (param is int) {
      return AppConstants.formatter.format(param);
    } else if (param == null) {
      return " ? ";
    }
    return AppConstants.formatter.format(int.parse(param.toString()));
  }

  static String dateTimeParser(String date) {
    var parsedDate = DateFormat('MMMM d, yyyy').parse(date);
    return parsedDate.toString();
  }
}
