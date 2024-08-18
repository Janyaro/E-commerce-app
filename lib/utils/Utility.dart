import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {
  void Mytoast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.pink.shade300,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        fontSize: 14);
  }
}
