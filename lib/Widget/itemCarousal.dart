import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class itemCarousalScreen extends StatelessWidget {
  final String carousalImg;
  final VoidCallback ontap;
  final String pname;
  final String pdescription;
  final String pprice;
  final String pdiscount;
  final String product_off;
  const itemCarousalScreen(
      {super.key,
      required this.carousalImg,
      required this.ontap,
      required this.pname,
      required this.pdescription,
      required this.pprice,
      required this.pdiscount,
      required this.product_off});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: ontap,
        child: Card(
          child: Container(
            width: double.infinity,
            // width: MediaQuery.of(context).size.width * 9,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.001),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 4,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    carousalImg,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.00001),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReadMoreText(
                        pname,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        trimMode: TrimMode.Line,
                        trimLines: 1,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001),
                      ReadMoreText(
                        pdescription,
                        trimMode: TrimMode.Line,
                        trimLines: 1,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              pprice,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0001),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pdiscount,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            product_off,
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            size: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Positioned(
//                 right: 0,
//                 top: 80,
//                 child: Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.white),
//                     child: TextButton(
//                       child: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.blue,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               )
