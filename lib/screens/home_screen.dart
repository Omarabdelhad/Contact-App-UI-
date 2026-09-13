import 'package:contact_app/core/styling/app_colors.dart';
import 'package:contact_app/core/styling/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(AppImages.routeTop, width: 117, height: 39),
        ),
        leadingWidth: 130,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 160),
          LottieBuilder.asset(
            'assets/animation/empty_list.json',
            fit: BoxFit.contain,
          ),
          Text(
            'There is No Contacts Added Here',
            style: TextStyle(
              fontSize: 20,
              fontWeight: .w500,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
