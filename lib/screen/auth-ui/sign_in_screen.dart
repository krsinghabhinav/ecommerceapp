import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerceapp/controller/authcontroller/signinConntroller.dart';
import 'package:ecommerceapp/screen/admin-panel/admin_main_screen.dart';
import 'package:ecommerceapp/screen/auth-ui/forgetpassword_screen.dart';
import 'package:ecommerceapp/screen/auth-ui/signup_screen.dart';
import 'package:ecommerceapp/screen/user-panel/main-screen.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:ecommerceapp/utils/toastmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controller/authcontroller/get_user_data_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Signinconntroller signinconntroller = Get.put(Signinconntroller());
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
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
                        padding: const EdgeInsets.all(10.0),
                        child: Obx(
                          () => TextFormField(
                            controller: userPasswordController,
                            obscureText:
                                signinconntroller.isPasswordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: AppConstant.appSecondaryColor,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    signinconntroller.isPasswordVisible
                                        .toggle();
                                  },
                                  child:
                                      signinconntroller.isPasswordVisible.value
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
                  GestureDetector(
                    onTap: () {
                      Get.to(ForgetpasswordScreen());
                    },
                    child: Container(
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
                          String password = userPasswordController.text.trim();
                          if (email.isEmpty || password.isEmpty) {
                            toastMessage("Please fill all fildes",
                                AppConstant.appSecondaryColor,
                                gravity: ToastGravity.BOTTOM);
                          } else {
                            UserCredential? userCredential =
                                await signinconntroller.signInMethode(
                                    email, password);
                            var userData = await getUserDataController
                                .getUserData(userCredential!.user!.uid);

                            // ignore: unnecessary_null_comparison
                            if (userCredential != null) {
                              if (userCredential.user!.emailVerified) {
                                if (userData[0]['isAdmin'] == true) {
                                  toastMessage("Admin Successfully Login",
                                      AppConstant.greenColor,
                                      gravity: ToastGravity.CENTER);
                                  Get.offAll(AdminMainScreen());
                                } else {
                                  toastMessage("User Successfully Login",
                                      AppConstant.greenColor,
                                      gravity: ToastGravity.CENTER);
                                  Get.offAll(MainScreen());
                                }
                              } else {
                                toastMessage("Firstlly Varify your email",
                                    AppConstant.toastColor,
                                    gravity: ToastGravity.TOP);
                              }
                            } else {
                              toastMessage("Please try again login",
                                  AppConstant.appSecondaryColor,
                                  gravity: ToastGravity.CENTER);
                            }
                          }
                        },
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
