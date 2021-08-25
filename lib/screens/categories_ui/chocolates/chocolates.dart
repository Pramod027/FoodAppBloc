import 'package:flutter/material.dart';

import '../../screen_export.dart';

class Chocolate extends StatefulWidget {
  @override
  _ChocolateState createState() => _ChocolateState();
}

class _ChocolateState extends State<Chocolate> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: [
                Tab(
                  text: 'Chocolate',
                ),
                Tab(
                  text: 'Chake',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CategoryPage(
              product: 'chocolate',
            ),
            CategoryPage(
              product: 'cake',
            ),
          ],
        ),
      ),
    );
  }
}
