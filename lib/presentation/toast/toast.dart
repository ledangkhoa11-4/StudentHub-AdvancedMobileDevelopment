
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {

  
  static void error(String msg, {Toast? length = null}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: length != null ? length : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
 
   static void success(String msg, {Toast? length = null}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: length != null ? length : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}
