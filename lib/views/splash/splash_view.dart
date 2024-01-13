// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/utils/controller_initlization.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    splashController.initscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child:
              SvgPicture.asset('assets/images/logo.svg', height: 50, width: 80),
        ),
      ),
    );
  }
}
