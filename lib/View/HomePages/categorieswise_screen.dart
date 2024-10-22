import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/FeatureList/beautyList.dart';
import 'package:ecommerce_app/FeatureList/fashionlist_screen.dart';
import 'package:ecommerce_app/FeatureList/kidslist.dart';
import 'package:ecommerce_app/FeatureList/menList_screen.dart';
import 'package:ecommerce_app/FeatureList/womanList.dart';
import 'package:ecommerce_app/View/HomePages/startedpage/defaulthome_screen.dart';
import 'package:ecommerce_app/Widget/feature_icon.dart';
import 'package:ecommerce_app/viewModel/featureIconProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    // Using carousel_slider prefix for CarouselController
    // final CarouselController _carouselController = CarouselController();
    // final CarouselController _imageController = CarouselController();

    CarouselSliderController _imageController = CarouselSliderController();
    CarouselSliderController _carouselController = CarouselSliderController();
    final screenProvider = Provider.of<ScreenProvider>(context);

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
                onChanged: (value) {},
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
                      color: screenProvider.containerColors[0],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/beauty.jpg',
                          ontap: () {
                            screenProvider.resetContainerColors();
                            screenProvider.updateContainerColor(0);
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
                      color: screenProvider.containerColors[1],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/fashion.jpg',
                          ontap: () {
                            screenProvider.resetContainerColors();
                            screenProvider.updateContainerColor(1);
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
                      color: screenProvider.containerColors[2],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/kids.jpg',
                          ontap: () {
                            screenProvider.resetContainerColors();
                            screenProvider.updateContainerColor(2);
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
                      color: screenProvider.containerColors[3],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/mens.jpg',
                          ontap: () {
                            screenProvider.resetContainerColors();
                            screenProvider.updateContainerColor(3);
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
                      color: screenProvider.containerColors[4],
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      FeatureIcon(
                          imagepath: 'asset/womens.jpg',
                          ontap: () {
                            screenProvider.resetContainerColors();
                            screenProvider.updateContainerColor(4);
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
            Consumer<ScreenProvider>(
              builder: (context, value, child) {
                return Container(child: _screens[value.screenIndex]);
              },
            )
          ],
        ),
      ),
    );
  }
}
