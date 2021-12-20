import '../constants/api_constants.dart';
import '../models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryDetailView extends StatelessWidget {
  final CountryModel countryModel;
  const CountryDetailView({Key? key, required this.countryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var response = countryModel.response![0];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "${response.country.toString()}\n(${response.continent.toString()})",
            textAlign: TextAlign.center,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                population(response),
                covidImage(),
                Container(
                  padding: AppConstants.padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(DateFormat.Hms()
                          .format(response.time!.toLocal())
                          .toString()),
                      Text(DateFormat.yMMMd().format(response.day!.toLocal())),
                    ],
                  ),
                ),
                casesTable(response.cases),
                deathsTable(response.deaths),
                testsTable(response.tests)
              ],
            ),
          ),
        ));
  }

  SizedBox covidImage() => SizedBox(
      height: 100,
      width: 100,
      child: Center(child: Image.asset("assets/covid.png")));

  Container casesTable(Cases? cases) {
    return Container(
      padding: AppConstants.padding,
      child: Card(
        child: Padding(
          padding: AppConstants.padding,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: AppConstants.padding,
                  color: AppConstants.caseColor,
                  child: AppConstants.titleText("Cases")),
              Padding(
                padding: AppConstants.padding,
                child: Table(
                  children: [
                    TableRow(children: [
                      const Text("New:"),
                      Text(AppConstants.convertTypes(cases!.casesNew)),
                    ]),
                    TableRow(children: [
                      const Text("Active:"),
                      Text(AppConstants.convertTypes(cases.active))
                    ]),
                    TableRow(children: [
                      const Text("Critical:"),
                      Text(AppConstants.convertTypes(cases.critical))
                    ]),
                    TableRow(children: [
                      const Text("Recovered:"),
                      Text(AppConstants.convertTypes(cases.recovered))
                    ]),
                    TableRow(children: [
                      const Text("T Cases/1M pop:"),
                      Text(AppConstants.convertTypes(cases.the1MPop))
                    ]),
                    TableRow(children: [
                      const Text("Total:"),
                      Text(AppConstants.convertTypes(cases.total))
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container deathsTable(Deaths? deaths) {
    return Container(
      padding: AppConstants.padding,
      child: Card(
        child: Padding(
          padding: AppConstants.padding,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: AppConstants.padding,
                  color: AppConstants.deathColor,
                  child: AppConstants.titleText("Deaths")),
              Padding(
                padding: AppConstants.padding,
                child: Table(
                  children: [
                    TableRow(children: [
                      const Text("New:"),
                      Text(AppConstants.convertTypes(deaths!.deathsNew))
                    ]),
                    TableRow(children: [
                      const Text("T Deaths/1M pop:"),
                      Text(AppConstants.convertTypes(deaths.the1MPop))
                    ]),
                    TableRow(children: [
                      const Text("Total:"),
                      Text(AppConstants.convertTypes(deaths.total))
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container testsTable(Tests? tests) {
    return Container(
      padding: AppConstants.padding,
      child: Card(
        child: Padding(
          padding: AppConstants.padding,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: AppConstants.padding,
                  color: AppConstants.testColor,
                  child: AppConstants.titleText("Tests:")),
              Padding(
                padding: AppConstants.padding,
                child: Table(
                  children: [
                    TableRow(children: [
                      const Text("T Tests/1M pop:"),
                      Text(AppConstants.convertTypes(tests!.the1MPop))
                    ]),
                    TableRow(children: [
                      const Text("Total:"),
                      Text(AppConstants.convertTypes(tests.total))
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container population(Response response) {
    return Container(
      padding: AppConstants.padding,
      child: AppConstants.titleText(
          "Population: ${AppConstants.convertTypes(response.population)}"),
    );
  }
}
