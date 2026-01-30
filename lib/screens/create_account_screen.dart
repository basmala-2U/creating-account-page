import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/resources/app_text_styles.dart';
import '../widgets/create_account_form.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.blackColor,
                        size: 28,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Create Account',
                      style: AppTextStyles.blackColor20SemiBold,
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 30),

                Text(
                  'Join the community',
                  style: AppTextStyles.blackColor32Bold,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your details to get started.',
                  style: AppTextStyles.primaryColor16Regular,
                ),
                const SizedBox(height: 30),

                const CreateAccountForm(),

                const SizedBox(height: 30),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyles.greyColor12Regular,
                        children: const [
                          TextSpan(text: 'By signing up, you agree to our '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}