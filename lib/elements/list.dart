import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodappbloc/data/model/food.dart';

Widget buildHintsList(BuildContext context, List<Recipe> recipes) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 175,
          child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 175,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(-1, -1),
                            blurRadius: 3),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 100,
                            width: 140,
                            child: Container(
                                height: 90,
                                width: 130,
                                child: Center(
                                  child: recipes[index].imageUrl == null
                                      ? SvgPicture.asset(
                                          'assets/images/picture.svg')
                                      : Image.network(
                                          recipes[index].imageUrl,
                                          fit: BoxFit.fill,
                                        ),
                                ))),
                        // SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            recipes[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Rs ${(recipes[index].socialRank.toInt()).toString()}',
                                maxLines: 3,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '40% off',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  'ADD',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 3,
        )
      ],
    ),
  );
}
