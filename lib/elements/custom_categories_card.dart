import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodappbloc/constants/app_colors.dart';
import 'package:foodappbloc/constants/app_sized_box.dart';

class CustomCategoryCard extends StatelessWidget {
  final String image;
  final VoidCallback cardPressed;
  final String categoryText;
  final Color color;

  const CustomCategoryCard(
      {Key key, this.image, this.cardPressed, this.categoryText, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => cardPressed(),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: AppColor().containerBorderColor),
              borderRadius: BorderRadius.circular(10),
              color: AppColor().kcWhite,
            ),
            height: 60,
            width: 60,
            child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  image,
                  height: 25,
                  color: color,
                )),
          ),
        ),
        kSboxH4,
        Text(
          categoryText,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
