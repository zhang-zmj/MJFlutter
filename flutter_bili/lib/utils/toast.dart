import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showWarnToast(String text){
  Fluttertoast.showToast(msg: text, toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white
  );
}


void showToast(String text){
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER
  );
}
