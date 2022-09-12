import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static customSnakbar(String title, message) {
    Get.snackbar(
      "$title",
      "$message",
      messageText: Text(
        "$message",
        style: const TextStyle(color: Colors.black),
      ),
      icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.purple.withOpacity(0.5),
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      colorText: Colors.white,
      duration: Duration(seconds: 2),
      isDismissible: true,
      dismissDirection: DismissDirection.up,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
