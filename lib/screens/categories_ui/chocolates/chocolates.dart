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
        appBar: AppBar(
          bottom: TabBar(
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
