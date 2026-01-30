import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../widgets/password_validation.dart';
import '../widgets/custom_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // متغيرات الـ Password Visibility
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // متغيرات التحقق من الباسورد
  bool hasMinLength = false;
  bool hasNumber = false;
  bool passwordsMatch = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    setState(() {
      hasMinLength = passwordController.text.length >= 8;
      hasNumber = passwordController.text.contains(RegExp(r'[0-9]'));
      passwordsMatch = passwordController.text.isNotEmpty &&
          passwordController.text == confirmPasswordController.text;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الـ Header
                _buildHeader(),

                const SizedBox(height: 30),

                // العنوان
                _buildTitle(),

                const SizedBox(height: 30),

                // الـ Input Fields
                CustomTextField(
                  label: 'Email Address',
                  hintText: 'alex@example.com',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Phone Number',
                  hintText: '+1 (555) 000-0000',
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Password',
                  hintText: '',
                  controller: passwordController,
                  isPassword: true,
                  isPasswordVisible: isPasswordVisible,
                  onToggleVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Confirm Password',
                  hintText: '',
                  controller: confirmPasswordController,
                  isPassword: true,
                  isPasswordVisible: isConfirmPasswordVisible,
                  onToggleVisibility: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),

                const SizedBox(height: 16),

                // شروط الباسورد
                PasswordRequirementItem(
                  text: 'At least 8 characters',
                  isValid: hasMinLength,
                ),
                const SizedBox(height: 8),
                PasswordRequirementItem(
                  text: 'Contains a number',
                  isValid: hasNumber,
                ),
                const SizedBox(height: 8),
                PasswordRequirementItem(
                  text: 'Passwords match',
                  isValid: passwordsMatch,
                ),

                const SizedBox(height: 30),

                // زر Sign Up
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    print('Sign Up pressed');
                  },
                ),

                const SizedBox(height: 20),

                // Already have an account
                _buildLoginLink(),

                const SizedBox(height: 30),

                // Terms and Privacy
                _buildTermsAndPrivacy(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // الـ Header (السهم والعنوان)
  Widget _buildHeader() {
    return Row(
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
        const Text(
          'Create Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const Spacer(),
        const SizedBox(width: 48),
      ],
    );
  }

  // العنوان والوصف
  Widget _buildTitle() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Join the community',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Enter your details to get started.',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  // رابط Log In
  Widget _buildLoginLink() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.greyColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Log In pressed');
            },
            child: const Text(
              'Log In',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Terms and Privacy
  Widget _buildTermsAndPrivacy() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              fontSize: 12,
              color: AppColors.greyColor,
            ),
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
    );
  }
}