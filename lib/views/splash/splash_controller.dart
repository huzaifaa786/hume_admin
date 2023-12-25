import 'dart:async'; 

import 'package:get/get.dart';
import 'package:hume_admin/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
      update();
    });
  }

  checkFirstSeen() async {
    // final User? user = FirebaseAuth.instance.currentUser;

    // if (user != null) {
    Get.offNamed(AppRoutes.welcome);
    // } else {
    // Get.offNamed(AppRoutes.signin);
    // }
  }
}
