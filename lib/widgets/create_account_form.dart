import 'package:flutter/material.dart';
import '../core/resources/app_text_styles.dart';
import '../core/resources/app_button_styles.dart';
import 'custom_text_field.dart';
import 'password_requirement_item.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _passwordsMatch = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    setState(() {
      _hasMinLength = _passwordController.text.length >= 8;
      _hasNumber = _passwordController.text.contains(RegExp(r'[0-9]'));
      _passwordsMatch = _passwordController.text.isNotEmpty &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Email Address',
            hintText: 'alex@example.com',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),

          CustomTextField(
            label: 'Phone Number',
            hintText: '+1 (555) 000-0000',
            controller: _phoneController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),

          CustomTextField(
            label: 'Password',
            hintText: '',
            controller: _passwordController,
            isPassword: true,
            isPasswordVisible: _isPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          const SizedBox(height: 20),

          CustomTextField(
            label: 'Confirm Password',
            hintText: '',
            controller: _confirmPasswordController,
            isPassword: true,
            isPasswordVisible: _isConfirmPasswordVisible,
            onToggleVisibility: () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
          ),
          const SizedBox(height: 16),

          PasswordRequirementItem(
            text: 'At least 8 characters',
            isValid: _hasMinLength,
          ),
          const SizedBox(height: 8),
          PasswordRequirementItem(
            text: 'Contains a number',
            isValid: _hasNumber,
          ),
          const SizedBox(height: 8),
          PasswordRequirementItem(
            text: 'Passwords match',
            isValid: _passwordsMatch,
          ),
          const SizedBox(height: 30),

          ElevatedButton(
            style: AppButtonStyles.primaryButtonStyle,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                debugPrint('Sign Up pressed');
              }
            },
            child: Text('Sign Up', style: AppTextStyles.whiteColor18SemiBold),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: AppTextStyles.greyColor14Regular,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('Log In pressed');
                },
                child: Text(
                  'Log In',
                  style: AppTextStyles.primaryColor14SemiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}