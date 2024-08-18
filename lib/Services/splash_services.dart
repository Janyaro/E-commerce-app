import 'dart:async';

import 'package:ecommerce_app/View/splash_screen/splashTwo.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void Islogin(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SplashTwo()));
    });
  }
}
