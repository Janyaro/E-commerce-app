import 'package:flutter/material.dart';

class descriptionCard extends StatelessWidget {
  final String title;
  final String description;
  final String btnText;
  final IconData icon;
  final IconData desIcon;
  final Color color;
  const descriptionCard(
      {super.key,
      required this.title,
      required this.description,
      required this.btnText,
      required this.icon,
      required this.desIcon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Icon(
                      desIcon,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(description,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white))
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  btnText,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
