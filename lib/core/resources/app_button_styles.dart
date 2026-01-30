import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppButtonStyles {
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 0,
  );
}