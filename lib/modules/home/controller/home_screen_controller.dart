import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/constant/helper.dart';
import 'package:getx_rest_api/model/home_data_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  HomeDataModel? homeDataModel;

  var isDataLoading = true.obs;
  //
  //var lstTask = List<dynamic>.empty(growable: true).obs;
  var page = 10.obs;
  var isDataProcession = false.obs;
  //for pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getTask(page);
    paginateTask();
    //getApi(counter.value);
    startTimer();
    //addItems();
    //generateList();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  /* :::::::::::::::::::: get api data :::::::::::::::::::::: */
  getApi(var page) async {
    print("hello : ");
    try {
      isDataLoading(true);
      homeDataModel?.results?.clear();
      http.Response response = await http.get(
        Uri.tryParse("https://randomuser.me/api/?results=$page")!,
      );
      print("status code : ${response.statusCode}");
      print("response body : ${response.body}");
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        homeDataModel = HomeDataModel.fromJson(result);
        //lstTask = HomeDataModel.fromJson(result);
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

  /* :::::::::::::::::::: Fetch Data :::::::::::::::::::::: */

  void getTask(var page) {
    try {
      isMoreDataAvailable(false);
      isDataProcession(true);
      getApi(page).then((resp) {
        isDataProcession(false);
        homeDataModel?.results?.addAll(resp);
      }, onError: (err) {
        isDataProcession(false);
        Helper.customSnakbar("Error", err.toString());
      });
    } catch (exception) {
      isDataProcession(false);
      Helper.customSnakbar("Exception", exception.toString());
    }
  }
  /* :::::::::::::::::::: Pagination :::::::::::::::::::::: */

  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        //getMoreTask(page);
      }
    });
  }

// /* :::::::::::::::::::: Pagination :::::::::::::::::::::: */
//   RxList<Results> list = <Results>[].obs;

//   RxInt listLength = 15.obs;
//   RxList results = [].obs;

//   addItems() async {
//     scrollController.addListener(() {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.position.pixels) {
//         counter.value++;
//         print("counter : $counter");
//         getApi(counter.value);
//       }
//     });
//   }

//   generateList() {
//     list = RxList.generate(
//         listLength.toInt(), (index) => Results(gender: (index + 1).toString()));
//   }

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
