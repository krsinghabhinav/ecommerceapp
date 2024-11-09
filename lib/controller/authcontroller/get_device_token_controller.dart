import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:ecommerceapp/utils/toastmessage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;
  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      //FirebaseMessaging eska use kiya jata h kisi bhi device ka unique token ya id ko get krne ke liye
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        print("token=========$deviceToken");
        update();
      }
    } catch (e) {
      toastMessage("Error $e", AppConstant.appSecondaryColor,
          gravity: ToastGravity.BOTTOM);
    }
  }
}
