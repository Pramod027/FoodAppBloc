import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodappbloc/ui/categories_ui/beef/beef.dart';
import 'package:foodappbloc/ui/categories_ui/chocolates/chocolates.dart';
import 'package:foodappbloc/ui/categories_ui/fast_food/fast_food.dart';
import 'package:foodappbloc/ui/categories_ui/fruits/fruits.dart';

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
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fruits()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  height: 60,
                  width: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/fruits.svg',
                      height: 25,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Fruits',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FastFood()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  height: 60,
                  width: 60,
                  child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/fast-food.svg',
                        height: 25,
                        color: Colors.red,
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Fast food',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Chocolate()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  height: 60,
                  width: 60,
                  child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/chocolate-bar.svg',
                        height: 25,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Chocolate',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Beef()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                  ),
                  height: 60,
                  width: 60,
                  child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/beef.svg',
                        height: 25,
                        color: Colors.brown,
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Beef',
                style: TextStyle(color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
