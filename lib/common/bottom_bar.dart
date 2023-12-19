import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';
import 'package:zzeenpay/features/dashboard/screens/transaction_screen.dart';
import 'package:zzeenpay/features/home/screens/home_screen.dart';
import 'package:zzeenpay/features/services/screens/services_screen.dart';

class MyBottomBar extends StatefulWidget {
  static const routeName = './actual-home';
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const TransactionScreen(),
    const ServicesScreen(),
    const Center(child: Text("Profile"),),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0,
        title: RichText(
          text: const TextSpan(
              text: "Welcome, ",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Jayaraj!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        items: [
          // Home
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/home.png',
                  height: 20, width: 20)),

          // Account
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/dashboard.png', height: 20, width: 20)),

          // Cart
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/card.png', height: 20, width: 20),
              ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/person.png', height: 20, width: 20),
          ),
        ],
      ),
    );
  }
}
