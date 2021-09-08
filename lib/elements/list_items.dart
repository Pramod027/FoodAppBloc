import 'package:flutter/material.dart';
import 'package:foodappbloc/elements/elements_export.dart';
import 'package:foodappbloc/screens/categories_ui/category_export.dart';
import 'package:foodappbloc/shared/app_colors.dart';

class CategoryItems extends StatefulWidget {
  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCategoryCard(
            cardPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Fruits()));
            },
            categoryText: 'Fruits',
            image: 'assets/images/fruits.svg',
            color: AppColor().kcGreen,
          ),
          CustomCategoryCard(
            cardPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FastFood()));
            },
            categoryText: 'Fast Food',
            image: 'assets/images/fast-food.svg',
            color: Colors.red,
          ),
          CustomCategoryCard(
            cardPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chocolate()));
            },
            categoryText: 'Chocolate',
            image: 'assets/images/chocolate-bar.svg',
            color: AppColor().kcBlack,
          ),
          CustomCategoryCard(
            cardPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beef()));
            },
            categoryText: 'Beef',
            image: 'assets/images/beef.svg',
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
