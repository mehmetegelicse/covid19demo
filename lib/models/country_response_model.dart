import 'dart:convert';

CountryResponse countryResponseFromJson(String str) =>
    CountryResponse.fromJson(json.decode(str));

String countryResponseToJson(CountryResponse data) =>
    json.encode(data.toJson());

class CountryResponse {
  CountryResponse({
    this.countryResponseGet,
    this.parameters,
    this.errors,
    this.results,
    required this.response,
  });

  String? countryResponseGet;
  List<dynamic>? parameters;
  List<dynamic>? errors;
  int? results;
  List<String> response;

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      CountryResponse(
        countryResponseGet: json["get"],
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        response: List<String>.from(json["response"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "get": countryResponseGet,
        "parameters": List<dynamic>.from(parameters!.map((x) => x)),
        "errors": List<dynamic>.from(errors!.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x)),
      };
}
