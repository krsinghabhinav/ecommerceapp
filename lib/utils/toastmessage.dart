import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage(String message, Color backgroundColor,
    {ToastGravity gravity = ToastGravity.BOTTOM}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
