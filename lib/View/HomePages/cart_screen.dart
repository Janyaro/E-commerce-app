import 'package:ecommerce_app/View/HomePages/payment_screen.dart';
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

  Future<void> deleteItem(int index) async {
    try {
      final key = box!.keyAt(index);
      await box!.delete(key);
      await getData(); // Refresh the data
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting item: $e');
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
        automaticallyImplyLeading: false,
      ),
      body: isBoxReady && fetchedData != null && fetchedData!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Shopping List',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: ListView.builder(
                      reverse: false,
                      itemCount: fetchedData!.length,
                      itemBuilder: (context, index) {
                        var item = fetchedData![index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShoppingBagScreen(
                                        title: item['productName'].toString(),
                                        description: '',
                                        img: item['productImage'].toString(),
                                        dis_amount:
                                            item['discount'].toString())));
                          },
                          child: CartWidget(
                            ondelete: () => deleteItem(index),
                            img: item['productImage'].toString(),
                            title: item['productName'].toString(),
                            totalprice: item['totalPrice'].toString(),
                            discount: item['discount'].toString(),
                            disprice: item['actualPrice'].toString(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: Center(
              child: Text('Cart is Empty'),
            )),
    );
  }
}
