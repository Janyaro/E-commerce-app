import 'package:flutter/material.dart';

class FeatureIcon extends StatelessWidget {
  final String imagepath;

  final VoidCallback ontap;
  const FeatureIcon({super.key, required this.imagepath, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.17,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.asset(
            imagepath,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
      ),
    );
  }
}
