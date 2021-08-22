import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodappbloc/bloc/food/food_bloc.dart';
import 'package:foodappbloc/bloc/food/food_event.dart';
import 'package:foodappbloc/bloc/food/food_state.dart';
import 'package:foodappbloc/elements/drawer.dart';
import 'package:foodappbloc/elements/error.dart';
import 'package:foodappbloc/elements/list.dart';
import 'package:foodappbloc/elements/list_items.dart';
import 'package:foodappbloc/elements/loading.dart';

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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFECEFF1)),
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
              SizedBox(
                height: 10,
              ),
              Container(
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
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'All Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CategoryItems(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Most Popular',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
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
            ],
          ),
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
