// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/firebase_options.dart';
import 'package:hume_admin/helper/loading.dart';
import 'package:hume_admin/routes/app_pages.dart';
import 'package:hume_admin/services/payment_service.dart';
import 'package:hume_admin/services/notification_service.dart';
import 'package:hume_admin/translation.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/home/home_binding.dart';
import 'package:hume_admin/views/home/home_view.dart';
import 'package:hume_admin/views/splash/splash_binding.dart';
import 'package:hume_admin/views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoadingHelper.init();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(PaymentService());
  Get.put(NotificationService());
  Stripe.publishableKey =
      "pk_test_51JvIZ1Ey3DjpASZjPAzcOwqhblOq2hbchp6i56BsjapvhWcooQXqh33XwCrKiULfAe7NKFwKUhn2nqURE7VZcXXf00wMDzp4YN";

  // Stripe.merchantIdentifier = 'merchant.com.ezmove';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    // box.read('Locale') == null ? box.write('Locale', 'en') : null;
    // String locale = box.read('Locale') ?? 'en';
    // return GoogleTranslatorInit('AIzaSyBOr3bXgN2bj9eECzSudyj_rgIFjyXkdn8',
    //     translateFrom: box.read('Locale') == 'en' ? Locale('ur') : Locale('en'),
    //     translateTo: Locale(locale),
    //     automaticDetection: false, builder: () {
    return GetMaterialApp(
      translations: LocaleString(),
      locale:
          box.read('locale') != 'ar' ? Locale('en', 'US') : Locale('ar', 'AE'),
      fallbackLocale:
          box.read('locale') != 'ar' ? Locale('en', 'US') : Locale('ar', 'AE'),
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: white,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: "Hume Admin".tr,
      initialBinding: SplashBinding(),
      home: SplashView(),
      getPages: AppPages.pages,
    );
    // });
  }
}
