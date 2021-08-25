import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/presentation/router/app_router.dart';

import 'bloc/category/category_bloc.dart';
import 'bloc/food/food_bloc.dart';
import 'data/export_data.dart';
import 'screens/categories_ui/bottom_nav_bar/nav_page.dart';

//const String API_BOX = 'api_data';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox(API_BOX);
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key key, this.appRouter}) : super(key: key);
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
          onGenerateRoute: appRouter.onGenerateRoute,
        ));
  }
}
