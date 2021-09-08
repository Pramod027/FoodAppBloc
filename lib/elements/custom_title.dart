import 'package:flutter/material.dart';
import 'package:foodappbloc/shared/app_colors.dart';
import 'package:foodappbloc/shared/app_styles.dart';

class CustomTitle extends StatelessWidget {
  final String categoryTitle;

  const CustomTitle({Key key, this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(categoryTitle, style: AppStyles().categoryText),
          SizedBox(
              width: 50,
              child: Divider(
                thickness: 1,
                color: AppColor().kcRed,
              ))
        ],
      ),
    );
  }
}
