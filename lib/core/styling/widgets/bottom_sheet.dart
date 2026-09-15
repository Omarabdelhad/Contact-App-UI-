import 'dart:io';

import 'package:contact_app/core/styling/app_colors.dart';
import 'package:contact_app/core/styling/widgets/custom_text_form_field.dart';
import 'package:contact_app/core/styling/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BottomSheetAddUser extends StatefulWidget {
  const BottomSheetAddUser({super.key});

  @override
  State<BottomSheetAddUser> createState() => _BottomSheetAddUserState();
}

class _BottomSheetAddUserState extends State<BottomSheetAddUser> {
  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> showOptionsToPickAnImage() async {
    final imageSource = await showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (imageSource != null) {
      await pickImage(imageSource);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 143,
                  height: 146,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundColor,
                    ),
                    onPressed: showOptionsToPickAnImage,
                    child: selectedImage != null
                        ? Image.file(selectedImage!)
                        : LottieBuilder.asset(
                            'assets/animation/image_picker.json',
                            fit: BoxFit.contain,
                          ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),

                      Divider(
                        color: AppColors.primaryColor,
                        indent: 4,
                        endIndent: 20,
                      ),
                      Text(
                        'example@email.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),

                      Divider(
                        color: AppColors.primaryColor,
                        indent: 4,
                        endIndent: 20,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+200000000000',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(hintText: 'Enter User Name '),
            SizedBox(height: 8),

            CustomTextFormField(hintText: 'Enter User Email  '),
            SizedBox(height: 8),

            CustomTextFormField(hintText: 'Enter User Phone '),
            SizedBox(height: 16),
            PrimaryButton(),
          ],
        ),
      ),
    );
  }
}
