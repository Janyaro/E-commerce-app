import 'package:ecommerce_app/View/HomePages/categorieswise_screen.dart';
import 'package:ecommerce_app/utils/Utility.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ShoppingBagScreen extends StatefulWidget {
  final String title;
  final String description;
  final String dis_amount;
  final String img;

  const ShoppingBagScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.img,
      required this.dis_amount});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Shopping Bag'),
        centerTitle: true,
        actions: [
          const Icon(Icons.favorite_border),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 320,
                        width: 180,
                        decoration: const BoxDecoration(),
                        child: Image.asset(
                          height: 200,
                          widget.img,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: width * 0.5,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.05,
                              ),
                              ReadMoreText(
                                widget.title,
                                trimMode: TrimMode.Line,
                                trimLines: 1,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                              Text(
                                widget.description,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Quaintiy'),
                                  Text('1'),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Delivery by:'),
                                  Text(
                                    '10 May 2XXX',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.001,
              ),
              SizedBox(
                height: height * 0.001,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.countertops_sharp,
                        size: 30,
                      ),
                      Text(
                        'Apply Coupons',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Select',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF83758)),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
                height: height * 0.07,
              ),
              const Text(
                'Order Payment Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Amounts',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(widget.dis_amount,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: height * 0.001,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Convenience',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Know More',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffF83758)),
                          ))
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Apply coupan',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF83758))))
                ],
              ),
              SizedBox(
                height: height * 0.001,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Delivery Fee',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Free',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF83758))))
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
                height: height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Order Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(widget.dis_amount,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
              Row(
                children: [
                  const Text('EMI Available',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Detail',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffF83758),
                          )))
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
                height: height * 0.07,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(widget.dis_amount,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text('View Detail',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffF83758))))
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Utility().Mytoast('Order Placed');
                      
                    },
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF83758)),
                      child: const Center(
                          child: Text(
                        'Proceed to Payment',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
    Container(
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: Colors.grey, width: 2)),
                                      child: TextButton.icon(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          label: const Text('Size'))),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: Colors.grey, width: 2)),
                                      child: TextButton.icon(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          label: const Text('QTY'))),
                              
*/
