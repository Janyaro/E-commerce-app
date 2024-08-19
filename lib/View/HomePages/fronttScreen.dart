import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_app/FeatureList/beautyList.dart';
import 'package:ecommerce_app/FeatureList/fashionlist_screen.dart';
import 'package:ecommerce_app/FeatureList/kidslist.dart';
import 'package:ecommerce_app/FeatureList/menList_screen.dart';
import 'package:ecommerce_app/FeatureList/womanList.dart';
import 'package:ecommerce_app/View/HomePages/startedpage/defaulthome_screen.dart';
import 'package:ecommerce_app/Widget/feature_icon.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
  List<Color> _containerColors = List<Color>.filled(5, Colors.white);
  @override
  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = const [
      DefaultHomeScreen(),
      BeautyList(),
      FeatureFashionList(),
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
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Any Product',
                  suffixIcon: Icon(Icons.speaker),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
              ),
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
                Container(
                  decoration: BoxDecoration(
                      color: _containerColors[0],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/beauty.jpg',
                          ontap: () {
                            setState(() {
                              _resetContainerColors();
                              _containerColors[0] =
                                  _containerColors[0] == Colors.white
                                      ? Colors.blue
                                      : Colors.white;
                              _screenIndex = 1;
                            });
                            print(
                              'beauty',
                            );
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        'Beauty',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _containerColors[1],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/fashion.jpg',
                          ontap: () {
                            setState(() {
                              _resetContainerColors();
                              _containerColors[1] =
                                  _containerColors[1] == Colors.white
                                      ? Colors.blue
                                      : Colors.white;
                              _screenIndex = 2;
                            });
                            print('fashion');
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        'Fashion',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _containerColors[2],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/kids.jpg',
                          ontap: () {
                            setState(() {
                              _resetContainerColors();
                              _containerColors[2] =
                                  _containerColors[2] == Colors.white
                                      ? Colors.blue
                                      : Colors.white;
                              _screenIndex = 3;
                            });
                            print('kids');
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        'Kids',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _containerColors[3],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/mens.jpg',
                          ontap: () {
                            setState(() {
                              _resetContainerColors();
                              _containerColors[3] =
                                  _containerColors[3] == Colors.white
                                      ? Colors.blue
                                      : Colors.white;
                              _screenIndex = 4;
                            });
                            print('men');
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        'Mens',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _containerColors[4],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/womens.jpg',
                          ontap: () {
                            setState(() {
                              _resetContainerColors();
                              _containerColors[4] =
                                  _containerColors[4] == Colors.white
                                      ? Colors.blue
                                      : Colors.white;
                              _screenIndex = 5;
                            });
                            print('women');
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                        'Womens',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
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

  void _resetContainerColors() {
    _containerColors = List<Color>.filled(5, Colors.white);
  }
}
