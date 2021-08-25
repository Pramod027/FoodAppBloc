import 'package:flutter/material.dart';

import '../../screen_export.dart';

class FastFood extends StatefulWidget {
  @override
  _FastFoodState createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.red,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              tabs: [
                Tab(
                  text: 'Chips',
                ),
                Tab(
                  text: 'Tacos',
                ),
                Tab(
                  text: 'Popcorn',
                ),
                Tab(
                  text: 'Pizza',
                ),
                Tab(
                  text: 'Donut',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CategoryPage(
              product: 'chips',
            ),
            CategoryPage(
              product: 'tacos',
            ),
            CategoryPage(
              product: 'popcorn',
            ),
            CategoryPage(
              product: 'pizza',
            ),
            CategoryPage(
              product: 'donuts',
            )
          ],
        ),
      ),
    );
  }
}
