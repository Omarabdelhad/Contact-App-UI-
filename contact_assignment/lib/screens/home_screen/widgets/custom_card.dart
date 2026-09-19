import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/core/styling/app_colors.dart';
import 'package:contact_app/screens/home_screen/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;
  const CustomCard({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                contact.image != null
                    ? Image.file(
                        contact.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                        ),
                        child: Icon(Icons.person, size: 48),
                      ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w500,
                        color: AppColors.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.email, size: 30, color: AppColors.backgroundColor),
                SizedBox(width: 8),
                Text(
                  contact.email,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: .w500,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.phone, size: 22, color: AppColors.backgroundColor),
                SizedBox(width: 8),
                Text(
                  contact.phone,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: .w500,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  backgroundColor: Colors.red,
                ),

                onPressed: onDelete,
                icon: Icon(Icons.delete, color: Colors.white),
                label: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: .w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
