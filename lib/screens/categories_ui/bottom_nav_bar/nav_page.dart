import 'package:flutter/material.dart';
import 'package:foodappbloc/shared/export_constant.dart';
import 'package:foodappbloc/screens/categories_ui/bottom_nav_bar/last_page.dart';
import 'package:foodappbloc/screens/categories_ui/bottom_nav_bar/second_page.dart';
import 'package:foodappbloc/screens/categories_ui/bottom_nav_bar/third.dart';

import 'home_page.dart';

class PageNavagation extends StatefulWidget {
  @override
  _PageNavagationState createState() => _PageNavagationState();
}

class _PageNavagationState extends State<PageNavagation> {
  int _selectedIndex = 0;

  PageController _pageController = PageController();
  List<Widget> _screen = [HomePage(), SecondPage(), ThirdPage(), LastPage()];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? AppColor().kcRed : Colors.grey,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: _selectedIndex == 1 ? AppColor().kcRed : Colors.grey),
              title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
                  color: _selectedIndex == 2 ? AppColor().kcRed : Colors.grey),
              title: Text('Shopping Cart')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,
                  color: _selectedIndex == 3 ? AppColor().kcRed : Colors.grey),
              title: Text('Profile')),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
