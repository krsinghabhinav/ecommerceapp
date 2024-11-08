import 'package:ecommerceapp/screen/auth-ui/welcome_screen.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: AppConstant.appMianColor,
        title: Text(AppConstant.appMainName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  onPressed: () {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    googleSignIn.signOut();
                    Get.offAll(WelcomeScreen());
                  },
                  icon: Icon(Icons.logout)),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
