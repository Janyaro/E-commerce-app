import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ReuseCarousalItemScreen extends StatelessWidget {
  const ReuseCarousalItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, _) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.001),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('asset/splash2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                  const Text(
                    'product.name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                  const Text(
                    'product.description',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                  Row(
                    children: [
                      const Text(
                        'product.price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.001),
                      const Text(
                        'product discription',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
                  const Text(
                    'product.discount',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.44,
              autoPlay: true,
              viewportFraction: 0.66)),
    );
  }
}
