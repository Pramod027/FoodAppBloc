import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/addition/addition_bloc.dart';
import 'package:foodappbloc/bloc/bloc_export.dart';
import 'package:foodappbloc/data/repositories/export_repo.dart';
import 'package:foodappbloc/screens/categories_ui/category_export.dart';
import 'package:foodappbloc/shared/export_constant.dart';

void main() async {
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
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(
              searchRepository: SearchRepositoryImpl(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Sizer',
          theme: ThemeData.light(),
          home: BlocProvider<CalculatorBloc>(
            create: (context) => CalculatorBloc(CalculatorInitial()),
            child: HomePage(),
          ),
          // home:ShimmerEg(),
          onGenerateRoute: AppRouter.onGenerateRoute,
        ));
  }
}
