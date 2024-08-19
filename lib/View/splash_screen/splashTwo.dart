import 'package:ecommerce_app/View/Auth_Screen/sign_in.dart';
import 'package:ecommerce_app/Widget/Reuse_container.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashTwo extends StatefulWidget {
  const SplashTwo({super.key});

  @override
  State<SplashTwo> createState() => _SplashTwoState();
}

class _SplashTwoState extends State<SplashTwo> {
  List<String> tiltes = ['Choose Products', 'Make Payment', 'Get Your Order'];
  List<String> imgName = [
    'asset/splash2.png',
    'asset/splash3.png',
    'asset/splash4.png'
  ];
  List<String> subtitle = [
    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${currentIndex + 1} /3',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    child: const Text(
                      'Skip',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Center(
                child: Image.asset(
                    height: 300, width: 300, imgName[currentIndex])),
            SplashContainer(
              title: tiltes[currentIndex],
              subtitle: subtitle[currentIndex],
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedSmoothIndicator(
                    activeIndex: currentIndex, count: tiltes.length),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                TextButton(
                    onPressed: () {
                      if (currentIndex == 2) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      } else {
                        setState(() {
                          currentIndex = (currentIndex + 1);
                        });
                      }
                    },
                    child: currentIndex == 2
                        ? const Text('Get Started',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))
                        : const Text('Next',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
