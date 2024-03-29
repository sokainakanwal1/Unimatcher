import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/calculator_card.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/ecat_input.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/mdcat_input.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/nts_input.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/nums_input.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                UMSizes.defaultSpace * 0.4,
                UMSizes.defaultSpace,
                UMSizes.defaultSpace * 0.4,
                UMSizes.defaultSpace),
            child: Text(
              'Want to Calculate Aggregate For?🤔',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.apply(
                  color: dark ? UMColors.white : UMColors.primary,
                  fontSizeDelta: 7),
            ),
          ),
          const SizedBox(height: 20),

          ///Cards
          CalculatorCard(
            imagePath: UMImages.mdcat,
            title: '  MDCAT',
            onPressed: () => Get.to(() => MdcatInput()),
          ),
          CalculatorCard(
            imagePath: UMImages.ecat,
            title: '  ECAT',
            onPressed: () => Get.to(() => EcatInput()),
          ),
          CalculatorCard(
            imagePath: UMImages.nts,
            title: '  NTS',
            onPressed: () => Get.to(() => NtsInput()),
          ),
          CalculatorCard(
            imagePath: UMImages.nums,
            title: '  NUMS',
            onPressed: () => Get.to(() => NumsInput()),
          ),
        ],
      ),
    ));
  }
}
