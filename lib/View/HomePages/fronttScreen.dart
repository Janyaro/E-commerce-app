import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/FeatureList/beautyList.dart';
import 'package:ecommerce_app/FeatureList/fashionlist_screen.dart';
import 'package:ecommerce_app/FeatureList/kidslist.dart';
import 'package:ecommerce_app/FeatureList/menList_screen.dart';
import 'package:ecommerce_app/FeatureList/womanList.dart';
import 'package:ecommerce_app/View/HomePages/startedpage/defaulthome_screen.dart';
import 'package:ecommerce_app/Widget/feature_icon.dart';
import 'package:flutter/material.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({super.key});

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  List<String> imgpath = [
    'asset/slider_image.jpg',
    'asset/fashion.jpg',
    'asset/kids.jpg'
  ];
  List<String> carImg = [
    'asset/image15.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
  ];

  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = const [
      DefaultHomeScreen(),
      BeautyList(),
      FashionListScreen(),
      KidsListScreen(),
      MensList(),
      WomenList()
    ];

    String searchValue = '';
    final CarouselController _carouselController = CarouselController();
    final CarouselController _imageController = CarouselController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Any Product',
                suffixIcon: Icon(Icons.speaker),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
              ),
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Feature',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sort',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.sort,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.filter,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FeatureIcon(
                        imagepath: 'asset/beauty.jpg',
                        ontap: () {
                          setState(() {
                            _screenIndex = 1;
                          });
                          print('beauty');
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text('Beauty')
                  ],
                ),
                Column(
                  children: [
                    FeatureIcon(
                        imagepath: 'asset/fashion.jpg',
                        ontap: () {
                          setState(() {
                            _screenIndex = 2;
                          });
                          print('fashion');
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text('Fashion')
                  ],
                ),
                Column(
                  children: [
                    FeatureIcon(
                        imagepath: 'asset/kids.jpg',
                        ontap: () {
                          setState(() {
                            _screenIndex = 3;
                          });
                          print('kids');
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text('Kids')
                  ],
                ),
                Column(
                  children: [
                    FeatureIcon(
                        imagepath: 'asset/mens.jpg',
                        ontap: () {
                          setState(() {
                            _screenIndex = 4;
                          });
                          print('men');
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text('Mens')
                  ],
                ),
                Column(
                  children: [
                    FeatureIcon(
                        imagepath: 'asset/womens.jpg',
                        ontap: () {
                          setState(() {
                            _screenIndex = 5;
                          });
                          print('women');
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text('Womens')
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            // Display the selected screen
            Container(child: _screens[_screenIndex]),
          ],
        ),
      ),
    );
  }
}
