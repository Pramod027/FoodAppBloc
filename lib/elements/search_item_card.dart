import 'package:flutter/material.dart';
import 'package:foodappbloc/constants/export_constant.dart';

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
              Container(
                  // height: 90,
                  // width: 100,
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
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
