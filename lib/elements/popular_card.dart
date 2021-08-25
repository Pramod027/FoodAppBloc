import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:foodappbloc/constants/app_colors.dart';

class CustomPopularCard extends StatelessWidget {
  final customCacheManager = CacheManager(Config(
    'customCacheKey',
    stalePeriod: Duration(days: 1),
  ));
  final String imageUrl;
  final String recipeName;
  final String price;

  CustomPopularCard({Key key, this.imageUrl, this.recipeName, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      // height: 180,
      width: 195,
      decoration: BoxDecoration(
        color: AppColor().kcWhite,
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: Offset(1, 1),
              blurRadius: 3),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 3 / 2,
                child: CachedNetworkImage(
                    cacheManager: customCacheManager,
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(
                          Icons.image,
                          color: Colors.grey,
                          size: 80,
                        ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          // SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              recipeName,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14, height: 1.4),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Rs $price',
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '40% off',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
