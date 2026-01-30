import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/resources/app_text_styles.dart';

class PasswordRequirementItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordRequirementItem({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isValid ? AppColors.greenColor : AppColors.redColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isValid ? Icons.check : Icons.close,
            color: AppColors.whiteColor,
            size: 14,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: isValid
              ? AppTextStyles.greenColor14Medium
              : AppTextStyles.redColor14Medium,
        ),
      ],
    );
  }
}