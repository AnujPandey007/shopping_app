import 'package:flutter/material.dart';
import 'package:shopping_app/screens/profile/profile.dart';
import 'package:shopping_app/screens/category/shopping_kart.dart';

import '../shared/constant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedItem = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            selectedItem = index;
          });
        },
        controller: pageController,
        children: const <Widget>[
          ShoppingKart(),
          Profile()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 3.5,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.themeColor,
          unselectedItemColor: Colors.black,
          currentIndex: selectedItem,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                  color: Colors.black,
                ),
                activeIcon:  Icon(
                  Icons.category_outlined,
                  color: AppColors.themeColor,
                ),
                label: "Category"
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
              activeIcon:  Icon(
                Icons.person_outline,
                color: AppColors.themeColor,
              ),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            setState(() {
              selectedItem = index;
              pageController.animateToPage(selectedItem, duration: const Duration(milliseconds: 200), curve: Curves.linear);
            });
          },
        ),
      ),
    );
  }
}




