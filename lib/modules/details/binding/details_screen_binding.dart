import 'package:get/get.dart';
import 'package:getx_rest_api/modules/details/controller/details_screen_controller.dart';

class DetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsScreenController>(
      () => DetailsScreenController(),
    );
  }
}
