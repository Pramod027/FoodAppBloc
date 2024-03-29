import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappbloc/shared/app_colors.dart';

class AppStyles {
  final title = TextStyle(
      fontSize: 14,
      fontFamily: '',
      height: 1.4,
      color: AppColor().kcBlack,
      fontWeight: FontWeight.w600);

  final subTitle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, fontFamily: '', height: 1.2);

  final redText = TextStyle(
      fontSize: 14,
      fontFamily: '',
      height: 1.2,
      color: AppColor().kcRed,
      fontWeight: FontWeight.w600);
  final headingSemiBold = TextStyle(
      fontSize: 15,
      fontFamily: '',
      height: 1.6,
      color: AppColor().kcBlack,
      fontWeight: FontWeight.w400);
  final addText = TextStyle(
      fontSize: 14,
      fontFamily: '',
      height: 1.4,
      color: AppColor().kcGreen,
      fontWeight: FontWeight.w400);
  final reviewText = TextStyle(
      fontSize: 15,
      fontFamily: '',
      height: 1.2,
      color: AppColor().kcBlack,
      fontWeight: FontWeight.w400);
  final detailTitle = TextStyle(
      fontSize: 18,
      fontFamily: '',
      height: 1.4,
      color: AppColor().kcBlack,
      fontWeight: FontWeight.w500);
  final addContent = TextStyle(
      fontSize: 16,
      fontFamily: '',
      height: 1.2,
      color: AppColor().kcWhite,
      fontWeight: FontWeight.w800);
  final collText = TextStyle(
      fontSize: 14,
      fontFamily: '',
      height: 1.2,
      color: Colors.black54,
      fontWeight: FontWeight.w400);
  final categoryText = TextStyle(
      fontSize: 15,
      fontFamily: '',
      height: 1.6,
      color: AppColor().kcBlack,
      fontWeight: FontWeight.w600);
}
