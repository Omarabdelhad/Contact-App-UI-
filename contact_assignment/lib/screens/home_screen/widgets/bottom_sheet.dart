import 'dart:io';

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/core/styling/app_colors.dart';
import 'package:contact_app/screens/home_screen/widgets/custom_text_form_field.dart';
import 'package:contact_app/screens/home_screen/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BottomSheetAddUser extends StatefulWidget {
  const BottomSheetAddUser({super.key});

  @override
  State<BottomSheetAddUser> createState() => _BottomSheetAddUserState();
}

class _BottomSheetAddUserState extends State<BottomSheetAddUser> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          nameController.text.isEmpty
                              ? 'User Name'
                              : nameController.text,
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
                          emailController.text.isEmpty
                              ? 'example@email.com'
                              : emailController.text,
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
                          phoneController.text.isEmpty
                              ? '+200000000000'
                              : phoneController.text,
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
              CustomTextFormField(
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Enter Your Name'
                    : null,
                hintText: 'Enter User Name ',
                controller: nameController,
                onChanged: (_) {
                  setState(() {});
                },
              ),
              SizedBox(height: 8),

              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty)
                    return 'Enter Your Email';
                  if (!value.contains('@'))
                    return 'The Email Must Be Contain @ ';
                  return null;
                },
                onChanged: (_) {
                  setState(() {});
                },
                hintText: 'Enter User Email  ',
                controller: emailController,
              ),
              SizedBox(height: 8),

              CustomTextFormField(
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Enter Your Phone'
                    : null,
                onChanged: (_) {
                  setState(() {});
                },
                hintText: 'Enter User Phone ',
                controller: phoneController,
              ),
              SizedBox(height: 16),
              PrimaryButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      ContactModel(
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        phone: phoneController.text.trim(),
                        image: selectedImage,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
