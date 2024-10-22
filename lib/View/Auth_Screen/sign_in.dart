import 'package:ecommerce_app/Services/Auth.services.dart';
import 'package:ecommerce_app/View/Auth_Screen/forget_password_screen.dart';
import 'package:ecommerce_app/View/Auth_Screen/sign_up.dart';
import 'package:ecommerce_app/View/HomePages/home_screen.dart';
import 'package:ecommerce_app/Widget/myBtn.dart';
import 'package:ecommerce_app/Widget/social_icon.dart';
import 'package:ecommerce_app/utils/Utility.dart';
import 'package:ecommerce_app/viewModel/AuthScreenProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    "Welcome\nBack!",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Consumer<AuthenticationProvider>(
                    builder: (context, authProvider, _) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: !authProvider.visible,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Password',
                      fillColor: const Color(0xffF3F3F3),
                      filled: true,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          authProvider.toggleVisibility(); // Toggle visibility
                        },
                        child: Icon(authProvider.visible
                            ? Icons.visibility
                            : Icons
                                .visibility_off), // Change icon based on visibility
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  );
                }),
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
                Consumer<AuthenticationProvider>(
                  builder: (context, authProvider, _) => MyBtn(
                      title: 'Login',
                      isloading: authProvider.isloading,
                      ontap: () {
                        authProvider.setloading(true);
                        AuthServices()
                            .signinUser(emailController.text.toString(),
                                passwordController.text.toString())
                            .then((value) {
                          authProvider.setloading(false);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreem()));
                        }).onError((error, stackTrace) {
                          authProvider.setloading(false);
                          Utility().Mytoast(error.toString());
                        });
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  children: [
                    const Text(
                      '- OR Continue with -',
                      style: TextStyle(fontSize: 14),
                    ),
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
                        const Text(
                          'Create An Account',
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            },
                            child: const Text('Sign Up',
                                style: TextStyle(fontSize: 18)))
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
