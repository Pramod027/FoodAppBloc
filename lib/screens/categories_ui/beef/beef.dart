import 'package:flutter/material.dart';
import 'package:foodappbloc/screens/screen_export.dart';

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.red,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
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
