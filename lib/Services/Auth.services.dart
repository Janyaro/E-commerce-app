import 'package:ecommerce_app/View/Auth_Screen/sign_in.dart';
import 'package:ecommerce_app/View/HomePages/home_screen.dart';
import 'package:ecommerce_app/View/splash_screen/splashTwo.dart';
import 'package:ecommerce_app/utils/Utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final auth = FirebaseAuth.instance;

  Future<void> UserChecker(BuildContext context) async {
    if (auth.currentUser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreem()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SplashTwo()));
    }
  }

  Future<void> signinUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      Utility().Mytoast('Check your Email');
    }).onError((error, stackTrace) {
      Utility().Mytoast(error.toString());
    });
  }

  Future<void> logout_user() async {
    await auth.signOut();
  }
}
