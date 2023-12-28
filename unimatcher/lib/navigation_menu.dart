import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/Home/screens/home.dart';
import 'package:unimatcher/features/Profile/screens/profile_screen.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/calculator.dart';
import 'package:unimatcher/features/comparison/screens/comparison.dart';
import 'package:unimatcher/features/study%20material/screens/Prepration.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: dark ? TColors.black : Colors.white,
            indicatorColor: dark
                ? TColors.white.withOpacity(0.1)
                : TColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.calculator), label: 'Calculator'),
              NavigationDestination(
                  icon: Icon(Iconsax.book1), label: 'Prepration'),
              NavigationDestination(
                  icon: Icon(Iconsax.arrow), label: 'Compare'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const CalculatorScreen(),
    const PreprationScreen(),
    const ComparisonScreen(),
    const ProfileScreen(),
  ];
}
