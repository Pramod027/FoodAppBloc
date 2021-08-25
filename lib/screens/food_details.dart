import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:foodappbloc/constants/app_sized_box.dart';
import 'package:foodappbloc/data/export_data.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodDetails extends StatefulWidget {
  final Recipe items;

  const FoodDetails({Key key, this.items}) : super(key: key);
  @override
  _FoodDetailsState createState() => _FoodDetailsState(items);
}

class _FoodDetailsState extends State<FoodDetails> {
  final customCacheManager = CacheManager(Config(
    'customCacheKey',
    stalePeriod: Duration(days: 1),
  ));
  final Recipe items;

  _FoodDetailsState(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFECEFF1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.grey.withOpacity(0.5),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => TotalPrice()));
              },
            )
          ],
          // title: Text(foodNotifier.currentFood.name),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(33),
                      bottomRight: Radius.circular(33),
                    ),
                    color: Color(0xFFFECEFF1)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CachedNetworkImage(
                      cacheManager: customCacheManager,
                      imageUrl: items.imageUrl,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 80,
                          ),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            items.title,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.4),
                          ),
                        ),
                        Text(
                          '\$${items.recipeId}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    kSboxH12,
                    ExpandablePanel(
                      header: Text(
                        'Product Details',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.2),
                      ),
                      expanded: Text(
                        items.publisher,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                        softWrap: true,
                      ),
                      collapsed: Text(
                        items.publisher,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                        softWrap: true,
                      ),
                    ),
                    kSboxH12,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Review',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SmoothStarRating(
                          starCount: 5,
                          isReadOnly: false, //for user update
                          size: 16,
                          rating: 3,
                          color: Colors.redAccent,
                          borderColor: Colors.red,
                          allowHalfRating: false,
                        ),
                      ],
                    ),
                    kSboxH20,
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: MaterialButton(
                        color: Color(0xFF81C784),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        onPressed: () {
//    async {
//                              model.addProduct(pizzaNotifier.currentFood);
//                            },
                        },
                        child: Text(
                          'Add To Basket',
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
