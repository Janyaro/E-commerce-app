import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/View/HomePages/featureIconlist_screen.dart';
import 'package:ecommerce_app/View/HomePages/shop_page.dart';
import 'package:ecommerce_app/Widget/card_component.dart';
import 'package:ecommerce_app/Widget/itemCarousal.dart';
import 'package:ecommerce_app/Widget/slider_image.dart';
import 'package:ecommerce_app/Widget/small_card.dart';
import 'package:flutter/material.dart';

class DefaultHomeScreen extends StatefulWidget {
  const DefaultHomeScreen({super.key});

  @override
  State<DefaultHomeScreen> createState() => _DefaultHomeScreenState();
}

class _DefaultHomeScreenState extends State<DefaultHomeScreen> {
  List<String> imgpath = [
    'asset/slider_image.jpg',
    'asset/fashion.jpg',
    'asset/kids.jpg'
  ];
  List<String> carImg = [
    'asset/image15.jpg',
    'asset/maskgroup.jpg',
    'asset/maskgroup.jpg',
  ];
  List<String> cart_title = [
    'Jordan Stay',
    'Women Printed Kurta',
    'HRX by Hrithik Roshan'
  ];
  List<String> cart_description = [
    'Neque porro quisquam est qui dolorem ipsum quia',
    'Neque porro quisquam est qui dolorem ipsum quia',
    'Neque porro quisquam est qui dolorem ipsum quia',
  ];
  List<int> cart_disprice = [1500, 2499, 1599];
  List<int> act_price = [2499, 4999, 4300];
  List<int> cart_percent = [40, 50, 30];

  // final CarouselController carouselController = CarouselController();
  // final CarouselController imageController = CarouselController();
  CarouselSliderController _imageController = CarouselSliderController();
  CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sliderImages(
          imgpath: imgpath,
          ontap: () {},
          pictitle: '50-40% OFF',
          picdis1: 'Now in (product)',
          picdis2: 'all colors',
          btntitle: 'Shop Now',
          btnicon: Icons.arrow_forward,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const descriptionCard(
            title: 'Deal of the Day',
            desIcon: Icons.timelapse,
            description: '22h 55m 20s remaining ',
            btnText: 'View All',
            color: Colors.blue,
            icon: Icons.arrow_forward),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 550,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: _imageController,
                itemCount:
                    cart_title.length, // Make sure this list is not empty.
                itemBuilder: (context, index, _) {
                  return itemCarousalScreen(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopScreen(
                                  img: carImg[index],
                                  title: cart_title[index],
                                  description: cart_description[index],
                                  price: '₹${act_price[index]}',
                                  desprice: '${cart_percent[index]}%Off',
                                  percent: '₹${cart_disprice[index]}',
                                )),
                      );
                    },
                    carousalImg: carImg[index],
                    pname: cart_title[index],
                    pdescription: cart_description[index],
                    pprice: '₹${act_price[index]}',
                    product_off: '${cart_percent[index]}%Off',
                    pdiscount: '₹${cart_disprice[index]}',
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.55,
                  autoPlay: false,
                  viewportFraction: 0.6,
                ),
              ),
              Positioned(
                right: 10,
                top: 80,
                child: InkWell(
                  onTap: () {
                    _imageController.nextPage();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 120,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(),
                  child: Image.asset('asset/womens.jpg'),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Special Offers',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.face,
                          color: Colors.amber,
                        )
                      ],
                    ),
                    Text(
                      maxLines: 2,
                      'We make sure you get the offer \n you need at best prices',
                      style: TextStyle(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CardComponent(),
        const SizedBox(
          height: 20,
        ),
        const descriptionCard(
            title: 'Trending Products ',
            desIcon: Icons.calendar_month,
            description: 'Last Date 29/02/22',
            btnText: 'View All',
            color: Colors.pink,
            icon: Icons.arrow_forward),
        const SizedBox(
          height: 20,
        ),
        // Yahan se start karna hai hamain
        Container(
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: cart_title.length,
                itemBuilder: (context, index, _) {
                  return itemCarousalScreen(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShopScreen(
                                  img: carImg[index],
                                  title: cart_title[index],
                                  description: cart_description[index],
                                  price: '₹${act_price[index]}',
                                  desprice: '${cart_percent[index]}%Off',
                                  percent: '₹${cart_disprice[index]}')));

                      // Your navigation or action here
                    },
                    carousalImg: carImg[index],
                    pname: cart_title[index],
                    pdescription: cart_description[index],
                    pprice: '₹${act_price[index]}',
                    product_off: '${cart_percent[index]}%Off',
                    pdiscount: '₹${cart_disprice[index]}',
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.52,
                  autoPlay: false,
                  viewportFraction: 0.6,
                ),
              ),
              Positioned(
                right: 10,
                top: 80,
                child: InkWell(
                  onTap: () {
                    _carouselController.nextPage();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Card(
          child: Container(
            width: double.infinity,
            height: 280,
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Image.asset('asset/hotsummer.png'),
                ),
                ListTile(
                  title: const Text(
                    'New Arrivals ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Summer’ 25 Collections',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FeatureListScreen()));
                    },
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'View All',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.001,
        ),
        Card(
          elevation: 2,
          child: Container(
            width: double.infinity,
            height: 380,
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sponserd',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.009,
                ),
                Center(child: Image.asset('asset/offsale.png')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'up to 50% Off',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
