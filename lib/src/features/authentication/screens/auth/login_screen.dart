import 'package:ecommerce_flutter/src/common_widgets/buttons/primary_button.dart';
import 'package:ecommerce_flutter/src/common_widgets/buttons/primary_text_button.dart';
import 'package:ecommerce_flutter/src/common_widgets/divider/divider.dart';
import 'package:ecommerce_flutter/src/common_widgets/text_field/text_field.dart';
import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:ecommerce_flutter/src/constants/text_strings.dart';
import 'package:ecommerce_flutter/src/features/authentication/screens/auth/sign_up.dart';
import 'package:ecommerce_flutter/src/features/authentication/screens/auth/widget/auth_header.dart';
import 'package:ecommerce_flutter/src/features/authentication/screens/forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../controllers/login_controller.dart';
import 'widget/auth_clipper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          LoginClipper(size: size),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 150, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeader(title: hLoginTitle, subTitle: hLoginSubTitle),
                  SizedBox(
                    height: hPadding * 2,
                  ),
                  Form(
                    key: formKey,
                    child: Column(children: [
                      CustomTextField(
                        controller: controller.email,
                        labelText: hEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: hPadding,
                      ),
                      CustomTextField(
                        controller: controller.password,
                        labelText: hPassword,
                        isSecret: true,
                      ),
                      SizedBox(
                        height: hPadding / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          PrimaryTextButton(
                            buttonContent: "Quên mật khẩu?",
                            style: TextStyle(
                              color: hBlueColor,
                            ),
                            onPressed: () {
                              Get.to(OTPScreen());
                            },
                          ),
                        ],
                      ),
                      PrimaryButton(
                        buttonContent: hLoginTitle,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginController.instance.loginUser(
                                controller.email.text.trim(),
                                controller.password.text.trim());
                          }
                        },
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: hPadding,
                  ),
                  CustomDivider(
                    text: 'Hoặc',
                  ),
                  SizedBox(
                    height: hPadding,
                  ),
                  PrimaryButton(
                    widget: Image.asset(
                      'assets/logo/google-logo.png',
                      width: 20.0,
                    ),
                    buttonContent: hLoginWithGoogle,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(hHaveNotAccount),
                      PrimaryTextButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        buttonContent: hSignUpTitle,
                        style: TextStyle(color: hBlueColor),
                      )
                    ],
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
