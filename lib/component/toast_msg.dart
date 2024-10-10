import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showtoast(String content) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.black,
      fontSize: 16.0);
}
showSuccessToast(String content) {
  Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.green.shade300,
      textColor: Colors.black,
      fontSize: 16.0);
}
