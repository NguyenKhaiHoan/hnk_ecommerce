import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();

  final isLoading = false.obs;

  Future<void> signup(String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);
    } catch (e) {
      throw e.toString();
    }
  }
}
