import 'package:flutter/material.dart';

class FeatureFashionList extends StatefulWidget {
  const FeatureFashionList({super.key});

  @override
  State<FeatureFashionList> createState() => _FeatureFashionListState();
}

class _FeatureFashionListState extends State<FeatureFashionList> {
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
    2699,
    999
  ];
  List<String> description = [
    'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
    'EARTHEN Rose Pink Embroidered Tiered Max...',
    'Antheaa Black & Rust Orange Floral Print Tiered Midi F...',
    'Blue cotton denim dress Look 2 Printed cotton dr...',
    'The classic Air Jordan 12 to create a shoe thats fres...',
    '6 GB RAM | 64 GB ROM | Expandable Upto 256...',
    'Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...',
    'This warm and comfortable jacket is great for learni...',
    'D7200 Digital Camera (Nikon) In New Area...',
    'George Walker Derby Brown Formal Shoes'
  ];
  List<String> title = [
    'Black Winter...',
    'Mens Starry',
    'Mens Starry',
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
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.4, // Set height for Expanded
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 8,
          childAspectRatio: 0.56,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      img[index],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0004,
                          ),
                          Text(
                            description[index],
                            style: const TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0004,
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
                                  width: MediaQuery.of(context).size.width *
                                      0.0004,
                                ),
                                const Text(
                                  '1,52,344',
                                  style: TextStyle(color: Colors.grey),
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
          );
        },
      ),
    );
  }
}
