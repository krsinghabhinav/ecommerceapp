import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerceapp/screen/auth-ui/signup_screen.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (BuildContext, bool isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondaryColor,
            centerTitle: true,
            title: Text(
              "Sign In",
              style: GoogleFonts.vollkorn(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  color: AppConstant.appTextColor),
            ),
          ), // backgroundColor: AppConstant.appSecondaryColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  isKeyboardVisible
                      ? Container(
                          height: Get.height / 10,
                          child: Center(
                            child: AnimatedTextKit(animatedTexts: [
                              WavyAnimatedText(
                                "Welcome to Sign In",
                                textStyle: GoogleFonts.lobster(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: AppConstant.appSecondaryColor),
                              ),
                            ]),
                          )) // Agar keyboard visible hai, toh kuch nahi dikhana
                      : Container(
                          height: Get.height / 2.1,
                          width: Get.width,
                          child: Lottie.asset(
                              "assets/animtion/auth3.json"), // Agar keyboard visible nahi hai, toh Lottie animation dikhana
                        ),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                          hintText: 'Emial',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppConstant.appSecondaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.visibility_off),
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppConstant.appSecondaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppConstant.appSecondaryColor),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Material(
                    child: Container(
                      height: Get.height / 16,
                      width: Get.width / 2.2,
                      decoration: BoxDecoration(
                          color: AppConstant.appSecondaryColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          "SIGN IN",
                          style: TextStyle(
                              color: AppConstant.appTextColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppConstant.appSecondaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(SignupScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppConstant.appSecondaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
