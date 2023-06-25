import 'package:ecommerce_flutter/src/common_widgets/buttons/primary_button.dart';
import 'package:ecommerce_flutter/src/common_widgets/buttons/primary_text_button.dart';
import 'package:ecommerce_flutter/src/common_widgets/divider/divider.dart';
import 'package:ecommerce_flutter/src/common_widgets/text_field/text_field.dart';
import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:ecommerce_flutter/src/constants/text_strings.dart';
import 'package:ecommerce_flutter/src/features/authentication/controllers/sign_up_controller.dart';
import 'package:ecommerce_flutter/src/features/authentication/screens/auth/widget/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../models/user_model.dart';
import 'login_screen.dart';
import 'widget/auth_clipper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          LoginClipper(size: size),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 150, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeader(title: hSignUpTitle, subTitle: hSignUpSubTitle),
                  SizedBox(
                    height: hPadding * 2,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.name,
                          labelText: hName,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.email,
                          labelText: hEmail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.phone,
                          labelText: hPhone,
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: controller.password,
                          labelText: hPassword,
                          isSecret: true,
                        ),
                        SizedBox(
                          height: hPadding + 10,
                        ),
                        PrimaryButton(
                          buttonContent: hSignUpTitle,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              SignUpController.instance.signup(
                                  controller.email.text.trim(),
                                  controller.password.text.trim());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(hHaveAccount),
                      PrimaryTextButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        buttonContent: hLoginTitle,
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
