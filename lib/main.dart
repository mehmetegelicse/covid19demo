import 'package:covid19demo/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      title: 'Covid-19 Statistics',
      getPages: AppRoute.routes,
    );
  }
}
