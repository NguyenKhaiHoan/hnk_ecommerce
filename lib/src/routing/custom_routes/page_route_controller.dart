import 'package:ecommerce_flutter/src/features/core/screen/cart/cart.dart';
import 'package:ecommerce_flutter/src/features/core/screen/favorite/favorite.dart';
import 'package:ecommerce_flutter/src/features/core/screen/home/home.dart';
import 'package:ecommerce_flutter/src/features/core/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRouteController extends GetxController {
  late PageController pageController;

  static PageRouteController get instance => Get.find();
  RxInt currentPage = 0.obs;
  RxBool isDarkTheme = false.obs;

  List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
