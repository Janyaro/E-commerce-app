import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final String img;
  final String title;
  final String totalprice;
  final String discount;
  final String disprice;
  final VoidCallback ondelete;
  const CartWidget(
      {super.key,
      required this.title,
      required this.totalprice,
      required this.discount,
      required this.disprice,
      required this.img,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(fit: BoxFit.cover, img)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // const SizedBox(
                    //   width: 0,
                    // ),
                    IconButton(
                        onPressed: ondelete,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    const Text(
                      'Variations : ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('black')),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      child: const Center(child: Text('White')),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text('Rating'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_half,
                      size: 15,
                      color: Colors.amber,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                ),
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Center(
                          child: Text(
                        discount,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          disprice,
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text(
                          totalprice,
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
