import 'package:get/get.dart';

class DetailsScreenController extends GetxController {
  final selected = "Name".obs;

  void setSelected(String value) {
    selected.value = value;
  }
}
