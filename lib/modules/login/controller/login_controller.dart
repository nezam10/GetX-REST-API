import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/constant/helper.dart';
import 'package:getx_rest_api/constant/route_constant.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userName = '';
  String userPassword = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    //formKey.
    super.onClose();
  }

  String? emailValidator(String value) {
    if (value.isEmpty || !value.contains('@')) {
      //return 'Please enter a valid email address.';
      Helper.customSnakbar(
          "Alert Message !", "Please enter a valid email address.");
    }
    return null;
  }

  String? userNameValidator(String value) {
    if (value.isEmpty || value.length < 4) {
      //return 'Name must be at least 4 characters long.';
      Helper.customSnakbar(
          "Alert Message !", "Name must be at least 4 characters long.");
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty || value.length < 7) {
      //return 'Password must be at least 7 characters long.';
      Helper.customSnakbar(
          "Alert Message !", "Password must be at least 7 characters long.");
    }
    return null;
  }

  void trySubmit() {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      formKey.currentState!.save();
      print("userEmail : $userEmail");
      print("userName : $userName");
      print("userPass : $userPassword");
      if (userEmail.isNotEmpty) {
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(userEmail)) {
          Helper.customSnakbar(
              "Alert Message !", "Enter a Valid Email address.");
        } else if (userName.isNotEmpty &&
            userEmail.isNotEmpty &&
            userPassword.length > 7) {
          Get.offAndToNamed(RouteConstant.homeScreen);
        }
      }
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // void validations(String val) async {
  //   errorText.value = null;
  //   submitFunc.value = null;
  //   if (val.isNotEmpty) {
  //     if (lengthOk(val) && await available(val)) {
  //       print("all validations passed, enable submit btn...");
  //       submitFunc.value = submitFunction();
  //       errorText.value = null;
  //     }
  //   }
  // }

  // bool lengthOk(String val, {int minLen = 5}) {
  //   if (val.length < 5) {
  //     errorText.value = "min. 5 chars";
  //     return false;
  //   }
  //   return true;
  // }

  // Future<bool> available(String val) async {
  //   print("Query availability of: $val");
  //   await Future.delayed(
  //       const Duration(seconds: 1), () => print("Available query returned"));
  //   if (val == 'Nezam') {
  //     errorText.value = "Name Taken";
  //     return false;
  //   }
  //   return true;
  // }

  // void usernameChaged(String val) {
  //   username.value = val;
  // }

  // Future<bool> Function() submitFunction() {
  //   return () async {
  //     print("Make database call to create : ${username.value} account");
  //     await Future.delayed(
  //         const Duration(seconds: 1), () => print("User account created"));
  //     return true;
  //   };
  // }
}
