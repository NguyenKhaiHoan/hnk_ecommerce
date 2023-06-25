import 'package:ecommerce_flutter/src/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'page_route_controller.dart';

class PageRouteRoot extends StatelessWidget {
  PageRouteRoot({super.key});

  final PageRouteController _pageRouteController =
      Get.put(PageRouteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  icon: IconlyLight.home,
                  page: 0,
                  context,
                  label: "Trang chủ",
                ),
                _bottomAppBarItem(
                    icon: IconlyLight.buy, page: 1, context, label: "Mua sắm"),
                _bottomAppBarItem(
                    icon: IconlyLight.heart,
                    page: 2,
                    context,
                    label: "Yêu thích"),
                _bottomAppBarItem(
                    icon: IconlyLight.profile,
                    page: 3,
                    context,
                    label: "Cá nhân"),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _pageRouteController.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _pageRouteController.animateToTab,
        children: [..._pageRouteController.pages],
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => _pageRouteController.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _pageRouteController.currentPage == page
                  ? hPrimaryColor
                  : Colors.grey,
              size: 20,
            ),
            Text(
              label,
              style: TextStyle(
                  color: _pageRouteController.currentPage == page
                      ? hPrimaryColor
                      : Colors.grey,
                  fontSize: 13,
                  fontWeight: _pageRouteController.currentPage == page
                      ? FontWeight.w600
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}
