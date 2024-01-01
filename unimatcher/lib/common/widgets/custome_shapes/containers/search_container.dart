import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/prefrence%20match/screens/match+prefrence.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/device/device_utility.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const PrefrenceMatch()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
            width: TDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
                color: TColors.white,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                border: Border.all(color: TColors.grey)),
            child: Row(
              children: [
                const Icon(Iconsax.search_normal, color: TColors.darkerGrey),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'Match Your Prefrence',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )),
      ),
    );
  }
}
