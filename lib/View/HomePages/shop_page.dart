import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/utils/Utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ShopScreen extends StatefulWidget {
  final String img;
  final String title;
  final String description;
  final String price;
  final String desprice;
  final String percent;
  const ShopScreen(
      {super.key,
      required this.img,
      required this.title,
      required this.description,
      required this.price,
      required this.desprice,
      required this.percent});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final CarouselController _carouselController = CarouselController();
  Box? box;
  bool isBoxReady = false;
  int item = 0;
  late Map<String, dynamic> userdata;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    try {
      box = await Hive.openBox('Shopcart');
      setState(() {
        isBoxReady = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error opening box: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title bar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: double.infinity,
                child: Image.asset(
                  width: double.infinity,
                  height: 300,
                  widget.img,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // const SizedBox(
                    //   height: 4,
                    // ),
                    Text(widget.description),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        Icon(
                          Icons.star,
                          size: 1,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '56,890',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.desprice,
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          widget.percent,
                          style: TextStyle(
                              fontSize: 17, color: Colors.pink.shade300),
                        ),
                      ],
                    ),
                    const Text(
                      'Product Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        maxLines: 6,
                        'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on),
                              Text('Nearest Store'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.lock),
                              Text('VIP'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.flip_camera_android_rounded),
                              Text('Return'),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            if (isBoxReady) {
                              try {
                                userdata = {
                                  'productImage': widget.img,
                                  'productName': widget.title,
                                  'actualPrice': widget.desprice,
                                  'discount': widget.percent,
                                  'totalPrice': widget.price
                                };

                                await box!.add(userdata).then((value) {
                                  Utility().Mytoast(
                                      'Data Successfully saved in Cart');
                                }).onError((error, stackTrace) {
                                  Utility().Mytoast(
                                      'Error adding data to Hive: $error');
                                });
                              } catch (e) {
                                Utility().Mytoast('Error : $e');
                              }
                            } else {
                              Utility().Mytoast('Box is not ready!');
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const CartScreen())
                          },
                          child: Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.blue),
                            child: const Center(
                                child: Text(
                              'Add to Cart ',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                                child: Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
