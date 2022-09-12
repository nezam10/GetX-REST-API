import 'package:get/get.dart';
import 'package:getx_rest_api/modules/login/controller/login_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
