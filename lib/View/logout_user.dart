import 'package:ecommerce_app/Services/Auth.services.dart';
import 'package:ecommerce_app/View/Auth_Screen/sign_in.dart';
import 'package:ecommerce_app/View/splash_screen/splash.dart';
import 'package:ecommerce_app/Widget/myBtn.dart';
import 'package:flutter/material.dart';

class LogoutUserScreen extends StatefulWidget {
  const LogoutUserScreen({super.key});

  @override
  State<LogoutUserScreen> createState() => _LogoutUserScreenState();
}

class _LogoutUserScreenState extends State<LogoutUserScreen> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                  child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(fit: BoxFit.cover, 'asset/userAccount.jpg'),
              )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MyBtn(
                title: 'Logout',
                isloading: isloading,
                ontap: () {
                  setState(() {
                    isloading = true;
                  });
                  AuthServices().logout_user().then((value) {
                    setState(() {
                      isloading = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn()));
                  }).onError((error, stackTrace) {
                    setState(() {
                      isloading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
