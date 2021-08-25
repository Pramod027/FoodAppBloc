import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodappbloc/bloc/category/category_export.dart';
import 'package:foodappbloc/data/export_data.dart';
import 'package:foodappbloc/elements/elements_widgets.dart';
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

//  bool get wantKeepAlive => true;
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
            child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: recipes[index].imageUrl == null
                            ? SvgPicture.asset('assets/images/picture.svg')
                            : CachedNetworkImage(
                                cacheManager: customCacheManager,
                                imageUrl: recipes[index].imageUrl,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                //errorWidget: (context, url, error) => Icon(Icons.error)
                                fit: BoxFit.cover),
                      ),
                    ),
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
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
  );
}
