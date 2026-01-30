import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTextStyles {
  //headers
  static const TextStyle blackColor32Bold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static const TextStyle blackColor20SemiBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static const TextStyle primaryColor16Regular = TextStyle(
    fontSize: 16,
    color: AppColors.primaryColor,
  );

  //labels
  static const TextStyle blackColor16Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  //button Text
  static const TextStyle whiteColor18SemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );

  //validation pass
  static const TextStyle greenColor14Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.greenColor,
  );

  static const TextStyle redColor14Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.redColor,
  );

  //link
  static const TextStyle greyColor14Regular = TextStyle(
    fontSize: 14,
    color: AppColors.greyColor,
  );

  static const TextStyle primaryColor14SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  // Terms
  static const TextStyle greyColor12Regular = TextStyle(
    fontSize: 12,
    color: AppColors.greyColor,
  );
}