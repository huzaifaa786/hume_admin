import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/services/auth_service.dart';
import 'package:hume_admin/utils/controller_initlization.dart';
import 'package:hume_admin/utils/validator.dart';
import 'package:hume_admin/views/home/home_view.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  final _authService = AuthService();
  int tabIndex = 0;
  bool passObscure = true;
  bool confirmPassObscure = true;
  RxBool validateSignUpForm = false.obs;

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

  Future<void> loginUser() async {
    final bool isFormValid = Validators.emailValidator(email.text) == null &&
        Validators.emptyStringValidator(password.text, '') == null;
    log('sddsdsdsdsdsdsdsssssssssssssss');
    if (isFormValid) {
      String? error = await _authService.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      if (error != null) {
        Get.showSnackbar(GetSnackBar(
          message: error.toString(),
          duration: const Duration(seconds: 3),
        ));
      } else {
        Get.put(AuthService());
      }
    }
  }

  clear() {
    email.clear();
    password.clear();

    update();
  }
}
