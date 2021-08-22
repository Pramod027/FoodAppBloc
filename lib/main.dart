import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/ui/categories_ui/bottom_nav_bar/nav_page.dart';
import 'bloc/category/category_bloc.dart';
import 'bloc/food/food_bloc.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/food_repository.dart';

//const String API_BOX = 'api_data';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox(API_BOX);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FoodBloc>(
            create: (context) => FoodBloc(repository: FoodRepositoryImpl()),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc(repository: CategoryRepositoryImpl()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Sizer',
          theme: ThemeData.light(),
          home: PageNavagation(),
        ));
  }
}
