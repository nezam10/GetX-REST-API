import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/constant/route_constant.dart';
import 'package:getx_rest_api/modules/home/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Home Page"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(
        () => homeScreenController.isDataLoading.value
            ? homeScreenController.isLoading.value
                ? Center(
                    child: Text("Data will be delayed...."),
                  )
                : Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: homeScreenController.homeDataModel!.results!.length,
                itemBuilder: (contex, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      ListTile(
                        onTap: () {
                          var testdata = homeScreenController
                              .homeDataModel?.results?[index];

                          Get.toNamed(RouteConstant.detailsScreen,
                              arguments: testdata);

                          print(homeScreenController
                              .homeDataModel?.results?[index].gender);
                        },
                        title: Text(
                            "${homeScreenController.homeDataModel?.results?[index].name?.title} "
                            "${homeScreenController.homeDataModel?.results?[index].name?.first}"),
                        subtitle: Text(
                            "Gender : ${homeScreenController.homeDataModel?.results?[index].gender}"),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "${homeScreenController.homeDataModel?.results?[index].picture?.large}"),
                        ),
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
