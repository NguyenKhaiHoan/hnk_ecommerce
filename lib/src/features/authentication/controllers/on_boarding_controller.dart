import 'package:ecommerce_flutter/src/features/authentication/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/onboarding/widget/on_boarding_content.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == pages.length - 1;
  var controller = PageController();

  next() {
    if (isLastPage) {
      Get.to(SignUpScreen());
    } else {
      controller.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  final pages = [
    OnBoardingWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage1,
        title: hOnBoardingTitle1,
        subTitle: hOnBoardingSubTitle1,
      ),
    ),
    OnBoardingWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage2,
        title: hOnBoardingTitle2,
        subTitle: hOnBoardingSubTitle2,
      ),
    ),
    OnBoardingWidget(
      model: OnBoardingModel(
        image: tOnBoardingImage3,
        title: hOnBoardingTitle3,
        subTitle: hOnBoardingSubTitle3,
      ),
    ),
  ];
}
