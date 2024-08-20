import 'package:ecommerce_app/View/HomePages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FeatureListScreen extends StatefulWidget {
  const FeatureListScreen({super.key});

  @override
  State<FeatureListScreen> createState() => _FeatureListScreenState();
}

class _FeatureListScreenState extends State<FeatureListScreen> {
  List<String> title = [
    'Black Winter...',
    'Mens Starry',
    'Black Dress',
    'Pink Embroide...',
    'Flare Dress',
    'denim dress',
    'Jordan Stay',
    'Realme 7 ',
    'Sony PS4',
    'Black Jacket 12...',
    'D7200 Digital C...',
    'men’s & boys s...'
  ];
  List<String> description = [
    'Autumn And Winter Casual cotton-padded jacket...',
    'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
    'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
    'EARTHEN Rose Pink Embroidered Tiered Max...',
    'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
    'Blue cotton denim dress Look 2 Printed cotton dr...',
    "The classic Air Jordan 12 to create a shoe that's fres...",
    '6 GB RAM | 64 GB ROM | Expandable Upto 256...',
    'Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...',
    'This warm and comfortable jacket is great for learni...',
    'D7200 Digital Camera (Nikon) In New Area...',
    'George Walker Derby Brown Formal Shoes'
  ];
  List<int> price = [
    499,
    399,
    2000,
    1900,
    1990,
    999,
    4999,
    3499,
    1999,
    2999,
    26999,
    999
  ];
  List<String> img = [
    'asset/blackwinter.png',
    'asset/menstary.png',
    'asset/blackdress.png',
    'asset/pinl.png',
    'asset/flare.png',
    'asset/denim.png',
    'asset/jorden.png',
    'asset/realme7.png',
    'asset/sony.png',
    'asset/blackjacket.png',
    'asset/d700.png',
    'asset/menboy.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search Any Prodduct',
                    suffixIcon: Icon(Icons.speaker),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Feature',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: img.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShopScreen(
                                      img: img[index],
                                      title: title[index],
                                      description: description[index],
                                      price: '0.00',
                                      desprice: '0% off',
                                      percent: price[index].toString())));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // height: 300,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  img[index],
                                  height: 150,
                                  width: 170,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ReadMoreText(
                                        title[index],
                                        trimMode: TrimMode.Line,
                                        trimLines: 1,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0004,
                                      ),
                                      ReadMoreText(
                                        description[index],
                                        trimMode: TrimMode.Line,
                                        trimLines: 1,
                                        trimCollapsedText: 'more',
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0004,
                                      ),
                                      Text(
                                        '₹${price[index]}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 15,
                                            ),
                                            const Icon(
                                              Icons.star_half,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.0004,
                                            ),
                                            const Text(
                                              '1,52,344',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
