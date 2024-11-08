import 'dart:async';

import 'package:ecommerceapp/screen/user-panel/main-screen.dart';
import 'package:get/get.dart';

import '../screen/auth-ui/sign_in_screen.dart';
import '../screen/auth-ui/signup_screen.dart';
import '../screen/auth-ui/welcome_screen.dart';

class Splacecontroller extends GetxController {
  var istrue = false.obs;

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(SignupScreen());
    });
    super.onInit();
  }
}
