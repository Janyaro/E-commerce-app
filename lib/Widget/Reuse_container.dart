import 'package:flutter/material.dart';

class SplashContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const SplashContainer(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: const TextStyle(fontSize: 16, color: Color(0xfffa8a8a9)),
            ),
          )
        ],
      ),
    );
  }
}
