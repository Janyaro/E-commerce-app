import 'package:ecommerce_app/Widget/profileComponent/textfieldcomponet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: ClipOval(
                      child: Container(
                    height: 200,
                    width: 200,
                    child:
                        Image.asset(fit: BoxFit.cover, 'asset/userAccount.jpg'),
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(
                        btntitle: 'Email Address', hint: 'Enter Email here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(
                        btntitle: 'Password', hint: 'password here'),
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Change Password'))),
                    const Text(
                      'Business Address Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const MyTextfield(
                        btntitle: 'Pin Code', hint: 'Pin code here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(
                        btntitle: 'Address', hint: 'Address here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(btntitle: 'City', hint: 'city here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(btntitle: 'State', hint: 'state here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(
                        btntitle: 'Country', hint: 'country here'),
                    const Text(
                      'Bank Account Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const MyTextfield(
                        btntitle: 'Bank Account Number', hint: 'Account here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(
                        btntitle: 'Account Holder’s Name', hint: 'Name here'),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyTextfield(btntitle: 'IFSC Code', hint: 'IFSC here'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink.shade400),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
