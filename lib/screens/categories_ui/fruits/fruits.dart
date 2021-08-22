import 'package:flutter/material.dart';
import 'package:foodappbloc/screens/category_page.dart';

class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Banana',
              ),
              Tab(
                text: 'Cherry',
              ),
              Tab(
                text: 'Grape',
              ),
              Tab(
                text: 'Pear',
              ),
              Tab(
                text: 'Strawberry',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryPage(
              product: 'banana',
            ),
            CategoryPage(
              product: 'cherry',
            ),
            CategoryPage(
              product: 'grape',
            ),
            CategoryPage(
              product: 'pear',
            ),
            CategoryPage(
              product: 'strawberry',
            )
          ],
        ),
      ),
    );
  }
}
