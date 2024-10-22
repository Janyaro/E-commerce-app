import 'package:ecommerce_app/View/HomePages/product_detail.dart';
import 'package:flutter/material.dart';

class KidsListScreen extends StatefulWidget {
  const KidsListScreen({super.key});

  @override
  State<KidsListScreen> createState() => _KidsListScreenState();
}

class _KidsListScreenState extends State<KidsListScreen> {
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
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const productDetailScreen(
                          img: 'asset/kids.jpg',
                          title: 'Black Winter...',
                          description:
                              'Autumn And Winter Casual cotton-padded jacket...',
                          price: '0% off ',
                          desprice: '0.00',
                          percent: '₹499')));
            },
            child: Card(
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
                        'asset/kids.jpg',
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
                            const Text(
                              'Black Winter...',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0004,
                            ),
                            const Text(
                              'Autumn And Winter Casual cotton-padded jacket...',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0004,
                            ),
                            const Text(
                              '₹499',
                              style: TextStyle(
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
            ),
          );
        },
      ),
    );
  }
}
