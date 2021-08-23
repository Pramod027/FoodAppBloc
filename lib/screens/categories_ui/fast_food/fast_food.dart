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
        appBar: AppBar(
          bottom: TabBar(
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
