import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:foodappbloc/constants/app_colors.dart';
import 'package:foodappbloc/constants/export_constant.dart';

class CustomPopularCard extends StatelessWidget {
  final customCacheManager = CacheManager(Config(
    'customCacheKey',
    stalePeriod: Duration(days: 1),
  ));
  final String imageUrl;
  final String recipeName;
  final String price;
  final VoidCallback pressed;

  CustomPopularCard(
      {Key key, this.imageUrl, this.recipeName, this.price, this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressed(),
      child: Container(
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
              child: Text(recipeName, style: AppStyles().title),
            ),
            kSboxH2,
            Padding(
              padding: const EdgeInsets.only(left: 2, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Rs $price',
                            maxLines: 3, style: AppStyles().subTitle),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '40% off',
                        style: AppStyles().redText,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: Text('ADD', style: AppStyles().addText),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
