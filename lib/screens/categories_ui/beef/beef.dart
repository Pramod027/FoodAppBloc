import 'package:flutter/material.dart';
import 'package:foodappbloc/ui/category_page.dart';

class Beef extends StatefulWidget {
  @override
  _BeefState createState() => _BeefState();
}

class _BeefState extends State<Beef> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Beef',
              ),
              Tab(
                text: 'Lamb',
              ),
              Tab(
                text: 'Pork',
              ),
              Tab(
                text: 'Ribs',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryPage(
              product: 'beef',
            ),
            CategoryPage(
              product: 'lamb',
            ),
            CategoryPage(
              product: 'pork',
            ),
            CategoryPage(
              product: 'ribs',
            ),
          ],
        ),
      ),
    );
  }
}
