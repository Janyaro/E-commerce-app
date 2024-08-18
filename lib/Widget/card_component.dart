import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Card(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.26,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Center(
                  child: Image.asset(
                'asset/slider2.png',
                fit: BoxFit.cover,
              )),
            ),
          ),
          Positioned(
            top: 20,
            right: 6,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    const Text(
                      'Flat and Heels',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Stand a chance to get rewarded',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(5)),
                      height: 40,
                      width: 160,
                      child: const SizedBox(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Visit Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
