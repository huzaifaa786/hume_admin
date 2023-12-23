// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume_admin/routes/app_pages.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/home/home_binding.dart';
import 'package:hume_admin/views/home/home_view.dart';
import 'package:hume_admin/views/splash/splash_binding.dart';
import 'package:hume_admin/views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
       
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: white,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      title: "Huma",
      initialBinding: HomeBinding(),
      home: HomeScreen(),
      getPages: AppPages.pages,
    );
  }
}
