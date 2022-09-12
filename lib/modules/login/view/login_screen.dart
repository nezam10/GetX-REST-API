import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_api/modules/login/controller/login_controller.dart';

import '../../../custom_widgets/custom_textform_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: loginController.formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomTextformField(
                  padding: const EdgeInsets.only(left: 10),
                  textAlign: TextAlign.start,
                  color: Colors.grey.shade200,
                  keyboardType: TextInputType.text,
                  labelText: "Name",
                  validator: (value) {
                    return loginController.userNameValidator(value!);
                  },
                  onSaved: (value) {
                    loginController.userName = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextformField(
                  padding: const EdgeInsets.only(left: 10),
                  textAlign: TextAlign.start,
                  color: Colors.grey.shade200,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Email Address",
                  validator: (value) {
                    return loginController.emailValidator(value!);
                  },
                  onSaved: (value) {
                    loginController.userEmail = value!;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextformField(
                  padding: const EdgeInsets.only(left: 10),
                  textAlign: TextAlign.start,
                  color: Colors.grey.shade200,
                  keyboardType: TextInputType.emailAddress,
                  labelText: "Password",
                  validator: (value) {
                    return loginController.passwordValidator(value!);
                  },
                  onSaved: (value) {
                    loginController.userPassword = value!;
                  },
                ),
                ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    loginController.trySubmit();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
