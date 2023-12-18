import 'package:get/get.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/views/splash/splash_binding.dart';
import 'package:hume_admin/views/splash/splash_view.dart';
import 'package:hume_admin/views/welcome/welcome_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
       GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
    ),
  ];
}
