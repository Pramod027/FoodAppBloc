import 'package:flutter/material.dart';
import 'package:foodappbloc/data/model/food.dart';
import 'package:foodappbloc/elements/popular_card.dart';

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
