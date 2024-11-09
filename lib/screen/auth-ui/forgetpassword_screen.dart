import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerceapp/controller/authcontroller/forget_password_controller.dart';
import 'package:ecommerceapp/screen/auth-ui/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';
import '../../utils/toastmessage.dart';

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (BuildContext, bool isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondaryColor,
            centerTitle: true,
            title: Text(
              "Forget Password",
              style: GoogleFonts.vollkorn(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
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
                                "Welcome to Reset Password",
                                textStyle: GoogleFonts.lobster(
                                    fontSize: 30,
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
                    height: Get.height / 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: userEmailController,
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
                        onPressed: () async {
                          String email = userEmailController.text.trim();
                          if (email.isEmpty) {
                            toastMessage("Please fill the fildes",
                                AppConstant.appSecondaryColor,
                                gravity: ToastGravity.BOTTOM);
                          } else {
                            forgetPasswordController.forgetPassMethode(email);
                            Get.offAll(SignInScreen());
                          }
                        },
                        label: Text(
                          "Forget",
                          style: TextStyle(
                              color: AppConstant.appTextColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 45,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
