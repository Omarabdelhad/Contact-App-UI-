import 'package:contact_app/core/styling/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        fixedSize: const Size(370, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Enter User',
        style: TextStyle(
          fontSize: 20,
          fontWeight: .w400,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
