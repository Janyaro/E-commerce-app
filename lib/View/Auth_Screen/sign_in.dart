import 'package:ecommerce_app/View/Auth_Screen/forget_password_screen.dart';
import 'package:ecommerce_app/View/Auth_Screen/sign_up.dart';
import 'package:ecommerce_app/View/HomePages/get_started.dart';
import 'package:ecommerce_app/Widget/myBtn.dart';
import 'package:ecommerce_app/Widget/social_icon.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    "Welcome\nBack!",
                    style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Username or Email',
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        fillColor: Color(0xffF3F3F3),
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: TextButton(
                          child: const Text('Forget password'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordScreen()));
                          },
                        ))),
                MyBtn(
                    title: 'Login',
                    isloading: isLoading,
                    ontap: () {
                      // setState(() {
                      //   isLoading = true;
                      // });
                      // auth
                      //     .signInWithEmailAndPassword(
                      //         email: emailController.text.toString(),
                      //         password: passwordController.text.toString())
                      //     .then((value) {
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               const GetStartedScreen()));
                      // }).onError((error, stackTrace) {
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      //   Utility().Mytoast(error.toString());
                      // });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetStartedScreen()));
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Column(
                  children: [
                    const Text('- OR Continue with -'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseSocialIcon(img: 'asset/google.png'),
                        ReuseSocialIcon(img: 'asset/apple.png'),
                        ReuseSocialIcon(img: 'asset/facebook.png'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Create An Account'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: const Text('Sign Up'))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
