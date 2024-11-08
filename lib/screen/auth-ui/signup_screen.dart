import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerceapp/controller/signup_controller.dart';
import 'package:ecommerceapp/screen/auth-ui/sign_in_screen.dart';
import 'package:ecommerceapp/utils/toastmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController signupController = Get.put(SignupController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (BuildContext, bool isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondaryColor,
            centerTitle: true,
            title: Text(
              "Sign Up",
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
                          height: Get.height / 12,
                          child: Center(
                            child: AnimatedTextKit(animatedTexts: [
                              WavyAnimatedText(
                                "Welcome to Sign Up",
                                textStyle: GoogleFonts.lobster(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: AppConstant.appSecondaryColor),
                              ),
                            ]),
                          )) // Ag visible hai, toh kuch nahi dikhana
                      : Container(
                          height: Get.height / 3.8,
                          child: Lottie.asset(
                              "assets/animtion/auth2.json"), // Agar keyboard visible nahi hai, toh Lottie animation dikhana
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                          hintText: 'UserName',
                          prefixIcon: Icon(Icons.person),
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: userPhoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                          hintText: 'phone',
                          prefixIcon: Icon(Icons.phone),
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
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: userCityController,
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                          hintText: 'City',
                          prefixIcon: Icon(Icons.location_pin),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => TextFormField(
                            obscureText:
                                signupController.isPasswordVisible.value,
                            controller: userPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: AppConstant.appSecondaryColor,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    signupController.isPasswordVisible.toggle();
                                  },
                                  child:
                                      signupController.isPasswordVisible.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: AppConstant.appSecondaryColor),
                              ),
                            ),
                          ),
                        )),
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
                          String name = userNameController.text.trim();
                          String email = userEmailController.text.trim();
                          String phone = userPhoneController.text.trim();
                          String city = userCityController.text.trim();
                          String password = userPasswordController.text.trim();
                          String userDeviceToken = '';

                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              city.isEmpty ||
                              password.isEmpty) {
                            toastMessage("Please enter all details",
                                AppConstant.toastColor,
                                gravity: ToastGravity.CENTER);
                          } else {
                            UserCredential? userCredential =
                                await signupController.signUpMethode(
                                    name,
                                    email,
                                    password,
                                    phone,
                                    city,
                                    userDeviceToken);
                            if (userCredential != null) {
                              toastMessage(
                                  " Please check your email for verification",
                                  AppConstant.appSecondaryColor);

                              FirebaseAuth.instance.signOut();
                              Get.to(SignInScreen());
                            }
                          }
                        },
                        label: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: AppConstant.appTextColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppConstant.appSecondaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(SignInScreen());
                        },
                        child: Text(
                          " Sign In",
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
