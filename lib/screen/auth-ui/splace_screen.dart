import 'dart:async';

import 'package:ecommerceapp/screen/auth-ui/welcome_screen.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controller/authcontroller/get_user_data_controller.dart';
import '../admin-panel/admin_main_screen.dart';
import '../user-panel/main-screen.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      loggin(context);
    });
    // splashController.loggin(context);
  }

  Future<void> loggin(BuildContext context) async {
    final GetUserDataController getUserDataController =
        Get.put(GetUserDataController());
    if (user != null) {
      var userData = await getUserDataController.getUserData(user!.uid);
      if (userData[0]['isAdmin'] == true) {
        Get.offAll(AdminMainScreen());
      } else {
        Get.offAll(MainScreen());
      }
    } else {
      Get.to(WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appSecondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.appSecondaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                child: Lottie.asset("assets/images/splash-icon.json"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              child: Text(
                AppConstant.appPoweredBy,
                style: GoogleFonts.caveat(
                    fontSize: 30,
                    color: AppConstant.appTextColor,
                    fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}
