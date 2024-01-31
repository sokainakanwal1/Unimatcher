import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/layout/university_grid_layout.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristycard.dart';
import 'package:unimatcher/features/Home/screens/home.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UMAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          GestureDetector(
              onTap: () => Get.to(const HomeScreen()),
              //  Get.to(const HomeScreen()),
              child: const Icon(Iconsax.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UMSizes.defaultSpace),
          child: Column(
            children: [
              UMGridLayout(
                  itemCount: 6,
                  itemBuilder: (_, index) => const UniversityCard())
            ],
          ),
        ),
      ),
    );
  }
}
