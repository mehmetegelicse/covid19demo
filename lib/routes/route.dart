import '../bindings/data_bindings.dart';
import '../views/home_view.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static final routes = [
    GetPage(name: "/home", page: () => HomeView(), binding: DataBinding()),
  ];
}
