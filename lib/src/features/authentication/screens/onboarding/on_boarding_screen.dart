import 'package:ecommerce_flutter/src/common_widgets/buttons/primary_button.dart';
import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:ecommerce_flutter/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: obController.controller,
              onPageChanged: obController.selectedPageIndex,
              children: obController.pages,
            ),
            Positioned(
                left: hPadding,
                bottom: hPadding,
                right: hPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        obController.pages.length,
                        (index) => Obx(() {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            width: obController.selectedPageIndex.value == index
                                ? 30
                                : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color:
                                  obController.selectedPageIndex.value == index
                                      ? hPrimaryColor
                                      : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          );
                        }),
                      ),
                    ),
                    Obx(
                      () => PrimaryButton(
                        onPressed: obController.next,
                        buttonContent:
                            obController.isLastPage ? 'Đăng ký' : 'Tiếp tục',
                        buttonWidth: 100,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
