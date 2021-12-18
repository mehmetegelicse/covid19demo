import 'package:covid19demo/bindings/data_bindings.dart';
import 'package:covid19demo/views/home_view.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static final routes = [
    GetPage(name: "/home", page: () => HomeView(), binding: DataBinding()),
  ];
}
