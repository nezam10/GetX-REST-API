import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_rest_api/model/home_data_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  HomeDataModel? homeDataModel;

  var isDataLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
    startTimer();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    print("hello : ");
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse("https://randomuser.me/api/?results=15")!,
      );
      print("status code : ${response.statusCode}");
      print("response body : ${response.body}");
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        homeDataModel = HomeDataModel.fromJson(result);
        print("result================ : $result");
        isDataLoading(false);
      } else {
        print("no data found");
      }
    } catch (e) {
      log("Error while getting data is : $e");
      print("Error while getting data is : $e");
    }
  }

  var isLoading = false.obs;
  void startTimer() {
    Timer.periodic(const Duration(seconds: 10), (t) {
      isLoading(true); //set loading to false
      t.cancel(); //stops the timer
    });
  }

  final selected = "Name".obs;

  void setSelected(String value) {
    selected.value = value;
  }
}
