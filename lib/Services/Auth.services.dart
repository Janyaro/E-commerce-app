import 'package:ecommerce_app/utils/Utility.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      Utility().Mytoast('Check your Email');
    }).onError((error, stackTrace) {
      Utility().Mytoast(error.toString());
    });
  }
}
