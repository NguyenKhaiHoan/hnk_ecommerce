import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  final isLoading = false.obs;

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email, password);
    } catch (e) {}
  }
}
