import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class PasswordRequirementItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordRequirementItem({
    super.key,
    required this.text,
    required this.isValid,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الدائرة الملونة
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

        // النص
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isValid ? AppColors.greenColor : AppColors.redColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}