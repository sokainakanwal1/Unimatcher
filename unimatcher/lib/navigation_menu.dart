import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/Home/screens/home.dart';
import 'package:unimatcher/features/Profile/screens/profile_screen.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/calculator.dart';
import 'package:unimatcher/features/comparison/screens/comparison.dart';
import 'package:unimatcher/features/study%20material/screens/prepration.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = UMHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: dark ? UMColors.black : Colors.white,
            indicatorColor: dark
                ? UMColors.white.withOpacity(0.1)
                : UMColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: ''),
              NavigationDestination(icon: Icon(Iconsax.book_saved), label: ''),
              NavigationDestination(icon: Icon(Iconsax.arrow), label: ''),
              NavigationDestination(
                icon: Icon(Iconsax.calculator),
                label: '',
              ),
              NavigationDestination(icon: Icon(Iconsax.user), label: ''),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    const StudyMaterial(),
    const UniversityComparisonScreen(),
    const CalculatorScreen(),
    const ProfileScreen(),
  ];
}
