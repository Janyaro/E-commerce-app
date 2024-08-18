import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final bool isloading;
  const MyBtn(
      {super.key,
      required this.title,
      required this.ontap,
      this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
            color: Color(0xffF83758),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
            child: isloading
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
      ),
    );
  }
}
