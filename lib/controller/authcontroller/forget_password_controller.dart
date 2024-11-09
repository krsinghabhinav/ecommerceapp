import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../utils/app-constant.dart';
import '../../utils/toastmessage.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<void> forgetPassMethode(
    String useremail,
  ) async {
    try {
      EasyLoading.show(status: "Please Wait...");
      await _auth.sendPasswordResetEmail(email: useremail);
      toastMessage(
          "Request sent sucessfully \n Password reset link send to $useremail",
          AppConstant.toastColor,
          gravity: ToastGravity.TOP);
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      toastMessage("Error $e", AppConstant.appSecondaryColor);
    }
  }
}
