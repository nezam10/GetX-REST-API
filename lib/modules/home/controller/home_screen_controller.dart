import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/model/home_data_model.dart';
import 'package:getx_rest_api/modules/home/view/home_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  HomeDataModel? homeDataModel;

  var isDataLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
    startTimer();
    addItems();
    generateList();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  /* :::::::::::::::::::: get api data :::::::::::::::::::::: */
  getApi() async {
    print("hello : ");
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse("https://randomuser.me/api/?results=20")!,
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

/* :::::::::::::::::::: Pagination :::::::::::::::::::::: */
  RxList<Results> list = <Results>[].obs;
  ScrollController controller = ScrollController();
  RxInt listLength = 15.obs;
  RxList results = [].obs;

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        for (RxInt i = 0.obs; i < 2; i++) {
          listLength++;
          list.add(Results(gender: (listLength).toString()));
        }
      }
    });
  }

  generateList() {
    list = RxList.generate(
        listLength.toInt(), (index) => Results(gender: (index + 1).toString()));
  }

  /* :::::::::::::::::::: Pagination Filter :::::::::::::::::::::: */

  // final _paginationFilter = PaginationFilter().obs;
  // final _lastPage = false.obs;
  // final _users = <HomeDataModel>[].obs;

  // List<HomeDataModel> get users => _users.toList();
  // int get limit => _paginationFilter.value.limit;
  // int get _page => _paginationFilter.value.page;
  // bool get lastPage => _lastPage.value;

  // Future<void> _getAllUsers() async {
  //   final userData = homeDataModel!.results!.length;
  //   if (userData.isEmpty) {
  //     _lastPage.value = true;
  //   }
  //   _users.addAll(userData);
  // }
}
