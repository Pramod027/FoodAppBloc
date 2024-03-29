import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/bloc/food/food_bloc.dart';
import 'package:foodappbloc/bloc/food/food_event.dart';
import 'package:foodappbloc/bloc/food/food_state.dart';
import 'package:foodappbloc/bloc/search/search_bloc.dart';
import 'package:foodappbloc/shared/app_sized_box.dart';
import 'package:foodappbloc/elements/custom_title.dart';
import 'package:foodappbloc/elements/elements_export.dart';
import 'package:foodappbloc/elements/search_delegates.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  FoodBloc foodBloc;

  @override
  void initState() {
    foodBloc = BlocProvider.of<FoodBloc>(context);
    foodBloc.add(FetchFoodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      drawer: DrawerPage(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'FoodApp',
          style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 110,
                    child: Text(
                      'Order Fresh Foods',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Positioned(
                    top: 45,
                    left: 120,
                    child: Text(
                      'Get Up To 40% OFF',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Color(0xFF81C784),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    right: -50,
                    child: Image.asset(
                      'assets/images/banner.png',
                      height: 80,
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: -20,
                    child: Image.asset(
                      'assets/images/banner3.png',
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            kSboxH12,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: () {}),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search product',
                            hintStyle: TextStyle(color: Colors.grey)),
                        onTap: () {
                          showSearch(
                              context: context,
                              delegate: FoodSearch(
                                  searchBloc:
                                      BlocProvider.of<SearchBloc>(context)));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTitle(
              categoryTitle: 'All Products',
            ),
            kSboxH12,
            CategoryItems(),
            kSboxH8,
            CustomTitle(categoryTitle: 'Most Popular'),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
              if (state is FoodInitialState) {
                return buildLoading();
              } else if (state is FoodLoadingState) {
                return buildLoading();
              } else if (state is FoodLoadedState) {
                return buildHintsList(context, state.recipes);
              } else if (state is FoodErrorState) {
                return buildError(state.message);
              } else
                return Container();
            }),
            kSboxH12
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    foodBloc.close();
    super.dispose();
  }
}
