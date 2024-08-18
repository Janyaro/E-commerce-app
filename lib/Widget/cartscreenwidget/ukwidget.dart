import 'package:flutter/material.dart';

class UKComponent extends StatelessWidget {
  final String ukSize;
  const UKComponent({super.key, required this.ukSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 4, color: Colors.pink.shade300)),
        child: Center(
            child: Text(
          ukSize,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.pink.shade300),
        )),
      ),
    );
  }
}
