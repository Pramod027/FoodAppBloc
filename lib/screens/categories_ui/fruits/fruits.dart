import 'package:flutter/material.dart';
import 'package:foodappbloc/shared/app_colors.dart';

import '../../screen_export.dart';

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: AppColor().kcWhite,
            elevation: 0,
            bottom: TabBar(
              labelColor: AppColor().kcBlack,
              indicatorColor: AppColor().indicatorColor,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
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
