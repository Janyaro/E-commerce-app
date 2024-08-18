import 'package:flutter/material.dart';

class ReuseSocialIcon extends StatelessWidget {
  final String img;
  const ReuseSocialIcon({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.pink.shade100,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
