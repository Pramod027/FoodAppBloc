import 'package:flutter/material.dart';
import 'package:foodappbloc/data/export_data.dart';
import 'package:foodappbloc/elements/elements_export.dart';

Widget buildHintsList(BuildContext context, List<Recipe> recipes) {
  return Container(
    height: 210,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              CustomPopularCard(
                pressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             FoodDetails(items: recipes[index])));
                  Navigator.pushNamed(context, '/foodDetails',
                      arguments: recipes[index]);
                },
                imageUrl: recipes[index].imageUrl,
                recipeName: recipes[index].title,
                price: recipes[index].socialRank.toInt().toString(),
              ),
              SizedBox(
                width: 15,
              )
            ],
          );
        }),
  );
}
