import 'package:ecommerce_app/Services/Auth.services.dart';
import 'package:ecommerce_app/Widget/myBtn.dart';
import 'package:ecommerce_app/utils/Utility.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  AuthServices authServices = AuthServices();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    'Forget \nPassword',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Username or Email',
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                    textAlign: TextAlign.start,
                    '* We will send you a message to set or reset your new password'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                MyBtn(
                    title: 'Submit',
                    ontap: () {
                      authServices
                          .resetPassword(emailController.text.toString());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
