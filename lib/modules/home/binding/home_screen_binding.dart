import 'package:get/get.dart';
import 'package:getx_rest_api/modules/home/controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
      fenix: true,
    );
  }
}
