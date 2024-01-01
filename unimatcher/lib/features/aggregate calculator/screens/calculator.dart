import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/calculator_card.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/inputMarks.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Text(
              'Want to Calculate Aggregate For?',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: TColors.primary, fontSizeDelta: 8),
            ),
          ),
          const SizedBox(height: 20),

          ///Cards
          CalculatorCard(
            imagePath: TImages.mdcat,
            title: '  MDCAT',
            onPressed: () => Get.to(() => const InputMarks()),
          ),
          CalculatorCard(
            imagePath: TImages.ecat,
            title: '  ECAT',
            onPressed: () => Get.to(() => const InputMarks()),
          ),
          CalculatorCard(
            imagePath: TImages.nts,
            title: '  NTS',
            onPressed: () => Get.to(() => const InputMarks()),
          ),
          CalculatorCard(
            imagePath: TImages.nums,
            title: '  NUMS',
            onPressed: () => Get.to(() => const InputMarks()),
          ),
        ],
      ),
    ));
  }
}
