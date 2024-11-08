import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastMessage(
  String message,
  Color toastColor, {
  Color backgroundColor = Colors.black,
  ToastGravity gravity = ToastGravity.CENTER,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity, // Uses the provided gravity or defaults to CENTER
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
