import 'dart:async';
import 'package:get/get.dart';
import 'package:hume_admin/services/auth_service.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
      update();
    });
  }

  checkFirstSeen() async {
    Get.put(AuthService());
  }
}
