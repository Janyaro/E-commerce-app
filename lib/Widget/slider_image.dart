import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class sliderImages extends StatelessWidget {
  final List<String> imgpath;
  final String pictitle;
  final String picdis1;
  final String picdis2;
  final String btntitle;
  final IconData btnicon;
  final VoidCallback ontap;
  const sliderImages(
      {super.key,
      required this.imgpath,
      required this.ontap,
      required this.pictitle,
      required this.picdis1,
      required this.picdis2,
      required this.btntitle,
      required this.btnicon});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imgpath.length,
        itemBuilder: (context, index, _) {
          return ClipRRect(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: Image.asset(
                          height: 250, fit: BoxFit.cover, imgpath[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pictitle,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            picdis1,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            picdis2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          InkWell(
                            onTap: ontap,
                            child: Container(
                                width: 160,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      btntitle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      btnicon,
                                      size: 25,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
        options: CarouselOptions(autoPlay: false, height: 250));
  }
}
