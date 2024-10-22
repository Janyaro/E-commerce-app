import 'package:ecommerce_app/Services/Auth.services.dart';
import 'package:ecommerce_app/View/Auth_Screen/sign_in.dart';
import 'package:ecommerce_app/Widget/myBtn.dart';
import 'package:ecommerce_app/viewModel/AuthScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Consumer<AuthenticationProvider>(
                builder: ((context, authProvider, child) => MyBtn(
                    title: 'Logout',
                    isloading: authProvider.isloading,
                    ontap: () {
                      authProvider.setloading(true);

                      AuthServices().logout_user().then((value) {
                        authProvider.setloading(false);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignIn()));
                      }).onError((error, stackTrace) {
                        authProvider.setloading(false);
                      });
                    }))),
          ],
        ),
      ),
    );
  }
}
