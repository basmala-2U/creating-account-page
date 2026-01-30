import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool? isPasswordVisible;
  final VoidCallback? onToggleVisibility;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.isPasswordVisible,
    this.onToggleVisibility,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // الـ Label (العنوان)
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 8),

        // الـ TextField
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword && !(isPasswordVisible ?? false),
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.blackColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.primaryColor, // البنفسجي للـ hint
              fontSize: 16,
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            // أيقونة العين للباسورد
            suffixIcon: isPassword
                ? IconButton(
              onPressed: onToggleVisibility,
              icon: Icon(
                isPasswordVisible!
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.primaryColor,
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}