import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/modules/home/controller/home_screen_controller.dart';

import '../../../model/home_data_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final homeScreenController = Get.find<HomeScreenController>();
  Results argumentValue = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Details Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage("${argumentValue.picture?.large}"),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[200],
              child: Text("Name : ${argumentValue.name?.title}"
                  " ${argumentValue.name?.first}"),
            ),
          ],
        ),
      ),
    );
  }
}
