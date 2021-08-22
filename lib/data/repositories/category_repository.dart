import 'dart:convert';

import 'package:foodappbloc/data/model/food.dart';
import 'package:http/http.dart' as http;

abstract class CategoryRepository {
  Future<List<Recipe>> getCategory(String category);
}

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<List<Recipe>> getCategory(String category) async {
    var response = await http
        .get(Uri.parse('https://forkify-api.herokuapp.com/api/search?q=$category'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Recipe> recipes = Food.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
