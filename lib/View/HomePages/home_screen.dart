import 'package:ecommerce_app/View/HomePages/cart_screen.dart';
import 'package:ecommerce_app/View/HomePages/featureIconlist_screen.dart';
import 'package:ecommerce_app/View/HomePages/fronttScreen.dart';
import 'package:ecommerce_app/View/HomePages/profile_screen.dart';
import 'package:ecommerce_app/viewModel/homeScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  List<Widget> tabBarScreen = const [
    FrontScreen(),
    FeatureListScreen(),
    CartScreen(),
    Text('Seach bar abhi nhi lga hai'),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    print('main bhi chl rha hoon');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(width: 90, 'asset/splashmain.png'),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'asset/userAccount.jpg',
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.blue.shade300,
        ),
        body: Consumer<HomeProvider>(builder: (context, homeProvider, index) {
          return tabBarScreen[homeProvider.selectedIndex];
        }),
        bottomNavigationBar: Consumer<HomeProvider>(
          builder: (context, homeProvider, index) {
            return BottomNavigationBar(
              backgroundColor: Colors.grey.shade400,
              currentIndex: homeProvider.selectedIndex,
              onTap: homeProvider.onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.shade400,
                  icon: const Icon(Icons.home),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  label: 'Wishlist',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
            );
          },
        ));
  }
}
