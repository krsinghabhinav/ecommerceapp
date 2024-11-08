import 'package:ecommerceapp/controller/splaceController.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  var splashController = Get.put(Splacecontroller());
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
