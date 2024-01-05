import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/device/device_utility.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return Positioned(
        right: UMSizes.defaultSpace,
        bottom: UMDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? UMColors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
