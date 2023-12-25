// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/guest_topbar.dart';
import 'package:hume_admin/components/input_field.dart';
import 'package:hume_admin/components/input_field_pass.dart';
import 'package:hume_admin/components/largebutton.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/login/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SvgPicture.asset('assets/images/dots.svg'),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Column(
                  children: [
                    GuestTopbar(),
                    Gap(40),
                    Column(
                      children: [
                        InputField(
                          hint: 'Email',
                          controller: controller.email,
                          color: maincolor,
                        ),
                        Gap(15),
                        PasswordInputField(
                          hint: 'Password',
                          controller: controller.password,
                          color: maincolor,
                          obscure: controller.passObscure,
                          toggle: controller.passToggle,
                        ),
                        Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 30.0, bottom: 20),
                              child: Text('Forget password?',
                                  style: TextStyle(
                                      color: maincolor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                        LargeButton(
                          title: 'Done',
                          textcolor: white,
                          onPressed: () {
                            // Get.toNamed(AppRoutes.home);
                          },
                          buttonWidth: 1.0,
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ));
  }
}
