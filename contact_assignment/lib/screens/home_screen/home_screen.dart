import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/core/styling/app_colors.dart';
import 'package:contact_app/core/styling/app_images.dart';
import 'package:contact_app/screens/home_screen/widgets/bottom_sheet.dart';
import 'package:contact_app/screens/home_screen/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> contacts = [];
  void deleteLast() {
    setState(() {
      contacts.removeLast();
    });
  }

  void deleteIndex(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (contacts.isNotEmpty) ...[
            FloatingActionButton(
              onPressed: deleteLast,
              heroTag: 'deleteLast',
              backgroundColor: AppColors.redColor,
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ],
          SizedBox(height: 8),
          if (contacts.length < 6)
            FloatingActionButton(
              heroTag: 'add',

              onPressed: () async {
                final result = await showModalBottomSheet<ContactModel>(
                  isScrollControlled: true,
                  context: context,

                  builder: (_) => const BottomSheetAddUser(),
                );
                if (result != null) {
                  setState(() {
                    contacts.add(result);
                  });
                }
              },

              child: Icon(Icons.add),
              backgroundColor: AppColors.primaryColor,
            ),
        ],
      ),

      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(AppImages.routeTop, width: 117, height: 39),
        ),
        leadingWidth: 128,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: contacts.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 160),
                LottieBuilder.asset(
                  'assets/animation/empty_list.json',
                  fit: BoxFit.cover,
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
            )
          : GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                childAspectRatio: .75,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => CustomCard(
                contact: contacts[index],
                onDelete: () {
                  deleteIndex(index);
                },
              ),
              itemCount: contacts.length,
            ),
    );
  }
}
