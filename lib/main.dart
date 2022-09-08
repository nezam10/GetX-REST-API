import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/constant/route_constant.dart';

import 'constant/get_pages.dart';
import 'modules/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: getPages,
      initialRoute: RouteConstant.homeScreen,
      home: HomeScreen(),
    );
  }
}
