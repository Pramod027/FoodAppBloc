import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodappbloc/shared/export_constant.dart';

class SearchItemCart extends StatelessWidget {
  final String itemName;
  final VoidCallback pressed;
  final String imageUrl;

  const SearchItemCart({Key key, this.itemName, this.pressed, this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pressed(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: CachedNetworkImage(
                      // cacheManager: customCacheManager,
                      imageUrl: imageUrl,
                      // placeholder: (context, url) =>
                      //     Center(child: CircularProgressIndicator()),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 80,
                          ),
                      fit: BoxFit.cover),
                ),
              ),
              kSboxH4,
              Text(
                itemName,
                style: AppStyles().title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
