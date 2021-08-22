import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:foodappbloc/data/model/food.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodDetails extends StatefulWidget {
  final Recipe items;

  const FoodDetails({Key key, this.items}) : super(key: key);
  @override
  _FoodDetailsState createState() => _FoodDetailsState(items);
}

class _FoodDetailsState extends State<FoodDetails> {
  final Recipe items;

  _FoodDetailsState(this.items);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    print(size);
    double height=MediaQuery.of(context).size.height;
    print(height);
    double width=MediaQuery.of(context).size.width;
    print(width);
    
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
                  child: Image.network(
                    items.imageUrl != null
                        ? items.imageUrl
                        : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                    fit: BoxFit.contain,
                  ),
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
                        Text(
                          items.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '\$${items.recipeId}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpandablePanel(
                      header: Text(
                        'Product Details',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      expanded: Text(
                        items.publisher,
                        style: TextStyle(
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
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Review',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
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
                    SizedBox(height: 20),
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