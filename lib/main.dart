import 'routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/home",
      title: 'Covid-19 Statistics',
      getPages: AppRoute.routes,
    );
  }
}
