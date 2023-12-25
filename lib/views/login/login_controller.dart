import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  int tabIndex = 0;
    bool passObscure = true;
    bool confirmPassObscure = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void setIndex(index) {
    tabIndex = index;
    update();
  }
    void passToggle() {
    passObscure = !passObscure;
    update();
  }
  
  void confirmPassToggle() {
    confirmPassObscure = !confirmPassObscure;
    update();
  }
}
