import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/models/user_model.dart';
import 'package:ecommerceapp/utils/app-constant.dart';
import 'package:ecommerceapp/utils/toastmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = false.obs;

  Future<UserCredential?> signUpMethode(
    String userName,
    String userEmail,
    String userPassword,
    String userPhone,
    String userCity,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: "Please wait...");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      await userCredential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: "",
          userDeviceToken: userDeviceToken,
          country: "",
          city: userCity,
          userAddress: "",
          street: "",
          isAdmin: false,
          isActive: true,
          createOn: DateTime.now());

//add data into database
      _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      toastMessage("Error \n $e", AppConstant.appSecondaryColor);
    }
  }
}
