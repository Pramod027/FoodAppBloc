import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodappbloc/bloc/category/category_export.dart';
import 'package:foodappbloc/data/export_data.dart';
import 'package:foodappbloc/elements/elements_widgets.dart';
import 'package:foodappbloc/elements/popular_card.dart';
import 'package:foodappbloc/screens/screen_export.dart';

class CategoryPage extends StatefulWidget {
  final String product;

  const CategoryPage({Key key, this.product}) : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryBloc categoryBloc;

  @override
  void initState() {
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(FetchCategoryEvent(product: widget.product));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  super.build(context);
    return Scaffold(
      body: SafeArea(
        child:
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          if (state is CategoryInitialState) {
            return buildLoading();
          } else if (state is CategoryLoadingState) {
            return buildLoading();
          } else if (state is CategoryLoadedState) {
            return builtCategoryList(context, state.recipes);
          }
          // else if (state is CategoryErrorState) {
          //   return buildError(state.message);
          // }
          else
            return CircularProgressIndicator();
        }),
      ),
    );
  }
}

Widget builtCategoryList(BuildContext context, List<Recipe> recipes) {
  final customCacheManager = CacheManager(Config(
    'customCacheKey',
    stalePeriod: Duration(days: 7),
  ));
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: StaggeredGridView.countBuilder(
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(1);
        },
        itemCount: recipes.length,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FoodDetails(items: recipes[index])));
              },
              child: CustomPopularCard(
                imageUrl: recipes[index].imageUrl,
                recipeName: recipes[index].title,
                price: recipes[index].socialRank.toInt().toString(),
              ));
        }),
  );
}
