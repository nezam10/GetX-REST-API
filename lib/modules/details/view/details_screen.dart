import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/modules/details/controller/details_screen_controller.dart';
import 'package:getx_rest_api/modules/home/controller/home_screen_controller.dart';

import '../../../model/home_data_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  DetailsScreenController detailsScreenController =
      Get.put(DetailsScreenController());

  final homeScreenController = Get.find<HomeScreenController>();
  Results argumentValue = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Details Page"),
        // actions: [
        //   Obx(
        //     () => DropdownButton(
        //         hint: Text("tx"),
        //         onChanged: (newValue) {
        //           detailsScreenController.setSelected(newValue!);
        //         },
        //         value: detailsScreenController.selected.value,
        //         icon: Icon(Icons.add),
        //         items: [
        //           DropdownMenuItem(
        //             child: Text("data"),
        //             value: "aa",
        //           ),
        //           DropdownMenuItem(
        //             child: Text("data"),
        //             value: "bb",
        //           ),
        //         ]),
        //   )
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => DropdownButton(
                  hint: Text("Name"),
                  onChanged: (newValue) {
                    detailsScreenController.setSelected(newValue!);
                  },
                  value: detailsScreenController.selected.value,
                  icon: Icon(Icons.arrow_drop_down),
                  items: argumentValue.name?.map((selectedType) {
                    return DropdownMenuItem(
                      child: Text(
                        selectedType.toString(),
                      ),
                      value: selectedType.toString(),
                    );
                  })),
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage("${argumentValue.picture?.large}"),
            ),
            const SizedBox(height: 20),
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
