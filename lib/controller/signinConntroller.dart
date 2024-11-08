import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:ecommerceapp/utils/toastmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Signinconntroller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isPasswordVisible = false.obs;
  Future<UserCredential?> signInMethode(
      String userEmail, String userPassword) async {
    try {
      EasyLoading.show(status: "Please wait....");
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      EasyLoading.dismiss();

      return result;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      toastMessage("Error $e", AppConstant.toastColor);
    }
  }
}
