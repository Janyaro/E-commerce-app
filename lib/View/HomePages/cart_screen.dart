import 'package:ecommerce_app/Widget/cartWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Box? box;
  List<Map<String, dynamic>>? fetchedData; // Updated to a list of maps
  bool isBoxReady = false;

  Future<void> openBox() async {
    try {
      box = await Hive.openBox('Shopcart');
      await getData();
      setState(() {
        isBoxReady = true;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error opening box: $e');
      }
    }
  }

  Future<void> getData() async {
    try {
      // Explicitly cast each item to Map<String, dynamic>
      fetchedData =
          box!.values.map((e) => Map<String, dynamic>.from(e as Map)).toList();
      if (kDebugMode) {
        print('Fetched Data: $fetchedData');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    openBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
        centerTitle: true,
      ),
      body: isBoxReady && fetchedData != null && fetchedData!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      const Text(
                        'Delivery Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Card(
                        elevation: 3,
                        child: Container(
                          width: 210,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const ListTile(
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Address ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.edit_note,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              maxLines: 2,
                              "216 St Paul's Rd, London N1 2LL, UK Contact:  +44-784232",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          width: 130,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.add_circle_outline_sharp,
                            size: 45,
                          )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Shopping List',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: fetchedData!.length,
                      itemBuilder: (context, index) {
                        var item = fetchedData![index];
                        return CartWidget(
                          img: item['productImage'].toString(),
                          title: item['productName'].toString(),
                          totalprice: item['totalPrice'].toString(),
                          discount: item['discount'].toString(),
                          disprice: item['actualPrice'].toString(),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
