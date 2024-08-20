import 'package:ecommerce_app/View/Auth_Screen/sign_in.dart';
import 'package:ecommerce_app/Widget/myBtn.dart';
import 'package:ecommerce_app/Widget/social_icon.dart';
import 'package:ecommerce_app/utils/Utility.dart';
import 'package:ecommerce_app/viewModel/AuthScreenProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _keyform = GlobalKey<FormState>();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create an\nAccount',
                    style: TextStyle(fontSize: 37, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Form(
                    key: _keyform,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              hintText: 'Username or Email',
                              fillColor: Color(0xffF3F3F3),
                              filled: true,
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email Address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Consumer<AuthenticationProvider>(
                            builder: (context, authProvider, index) {
                          return TextFormField(
                            controller: passwordController,
                            obscureText: !authProvider.Visible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              fillColor: const Color(0xffF3F3F3),
                              filled: true,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: InkWell(
                                onTap: () {
                                  authProvider
                                      .toggleVisibility(); // Toggle visibility
                                },
                                child: Icon(authProvider.Visible
                                    ? Icons.visibility
                                    : Icons
                                        .visibility_off), // Change icon based on visibility
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          );
                        }),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // TextFormField(
                        //   controller: confirmpassController,
                        //   decoration: const InputDecoration(
                        //       hintText: 'confirm password',
                        //       fillColor: Color(0xffF3F3F3),
                        //       filled: true,
                        //       prefixIcon: Icon(Icons.lock),
                        //       suffixIcon: Icon(Icons.visibility),
                        //       border: OutlineInputBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(10)))),
                        //   validator: (value) {
                        //     if (value!.isEmpty || value.length < 8) {
                        //       return 'Enter Password';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        MyBtn(
                            title: 'Create Account',
                            isloading: isloading,
                            ontap: () {
                              if (_keyform.currentState!.validate()) {
                                setState(() {
                                  isloading = true;
                                });
                                auth
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString())
                                    .then((value) {
                                  setState(() {
                                    isloading = false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignIn()));
                                }).onError((error, stackTrace) {
                                  setState(() {
                                    isloading = false;
                                  });
                                  Utility().Mytoast(error.toString());
                                });
                              }
                            }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
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
                                const Text('I Already Have an Account'),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignIn()));
                                    },
                                    child: const Text('Login'))
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
