import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappbloc/data/model/food.dart';
import 'package:foodappbloc/screens/categories_ui/bottom_nav_bar/nav_page.dart';
import 'package:foodappbloc/screens/food_details.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PageNavagation());
      default:
        return null;
    }
  }
}
