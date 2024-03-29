import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:foodappbloc/data/export_data.dart';
import 'package:foodappbloc/shared/export_constant.dart';
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
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(
                            Icons.image,
                            color: Colors.grey,
                            // size: 80,
                          ),
                      fit: BoxFit.contain),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    kSboxH12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            items.title,
                            style: AppStyles().detailTitle,
                          ),
                        ),
                        Text('\$${items.recipeId}',
                            style: AppStyles().headingSemiBold),
                      ],
                    ),
                    kSboxH12,
                    ExpandablePanel(
                      header: Text(
                        'Product Details',
                        style: AppStyles().headingSemiBold,
                      ),
                      expanded: Text(
                        items.publisher,
                        style: AppStyles().collText,
                        softWrap: true,
                      ),
                      collapsed: Text(
                        items.publisher,
                        style: AppStyles().collText,
                        softWrap: true,
                      ),
                    ),
                    kSboxH12,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Review',
                            style: AppStyles().reviewText,
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
                        child: Text('Add To Basket',
                            style: AppStyles().addContent),
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
