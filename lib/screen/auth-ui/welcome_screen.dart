import 'package:ecommerceapp/controller/authcontroller/google_signin_controller.dart';
import 'package:ecommerceapp/screen/auth-ui/sign_in_screen.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  GoogleSigninController _googleSigninController =
      Get.put(GoogleSigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text(
          'Welcome to my app',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Lottie.asset("assets/images/splash-icon.json"),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Happy shopping",
                  style: GoogleFonts.vollkorn(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 4,
              ),
              Material(
                child: Container(
                  height: Get.height / 16,
                  width: Get.width / 1.2,
                  decoration: BoxDecoration(
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton.icon(
                    onPressed: () {
                      _googleSigninController.signInwithGoogle();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/images/final-google-logo.png",
                        height: 30,
                      ),
                    ),
                    label: Text(
                      "Sign in with google",
                      style: TextStyle(
                          color: AppConstant.appTextColor, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 35,
              ),
              Material(
                child: GestureDetector(
                  onTap: () {
                    Get.to(SignInScreen());
                  },
                  child: Container(
                    height: Get.height / 16,
                    width: Get.width / 1.2,
                    decoration: BoxDecoration(
                        color: AppConstant.appSecondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                      onPressed: () {
                        Get.to(SignInScreen());
                      },
                      icon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.email,
                            size: 35,
                            color: AppConstant.appTextColor,
                          )),
                      label: Text(
                        "Sign in with email",
                        style: TextStyle(
                            color: AppConstant.appTextColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
