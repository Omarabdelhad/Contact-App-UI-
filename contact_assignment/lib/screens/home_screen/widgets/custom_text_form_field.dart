import 'package:contact_app/core/styling/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(color: AppColors.hintTextColor),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: .w400,
          color: AppColors.hintTextColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(16),
        ),
         errorStyle: TextStyle(
          color: AppColors.redColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),

      ),
    );
  }
}
