import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:ecommerce_flutter/src/features/authentication/screens/auth/login_screen.dart';
import 'package:ecommerce_flutter/src/features/authentication/screens/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/buttons/primary_button.dart';
import '../../../../common_widgets/buttons/primary_text_button.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(hPadding),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hWelcome,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: hPadding * 3,
                    ),
                    PrimaryButton(
                      labelColor: hPrimaryColor,
                      onPressed: () => Get.to(OnBoardingScreen()),
                      buttonContent: hLetsBegin,
                    ),
                    SizedBox(
                      height: hPadding - 10,
                    ),
                    PrimaryTextButton(
                        buttonContent: hHaveAccount,
                        onPressed: () => Get.to(LoginScreen())),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
