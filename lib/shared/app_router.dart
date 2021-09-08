import 'package:flutter/material.dart';
import 'package:foodappbloc/screens/categories_ui/bottom_nav_bar/nav_page.dart';
import 'package:foodappbloc/screens/screen_export.dart';
import 'package:foodappbloc/shared/app_screens.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => PageNavagation());
        break;

      case foodDetails:
        return MaterialPageRoute(
            builder: (_) => FoodDetails(
                  items: args,
                ));
        break;

      default:
        return null;
    }
  }
}
