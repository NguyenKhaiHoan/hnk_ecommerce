import 'package:ecommerce_flutter/src/features/core/screen/home/home.dart';
import 'package:ecommerce_flutter/src/routing/custom_routes/page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  late final GoogleSignInAccount googleUser;
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  var verificationId = ''.obs;

  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => _firebaseUser.value?.uid ?? "";

  String get getUserEmail => _firebaseUser.value?.email ?? "";

  String get getUserPhoneNo => _firebaseUser.value?.phoneNumber ?? "";

  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => PageRouteRoot());
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser != null
          ? Get.offAll(() => PageRouteRoot())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
