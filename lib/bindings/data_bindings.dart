import '../controllers/home_controller.dart';
import 'package:get/instance_manager.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
