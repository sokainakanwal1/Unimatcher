import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unimatcher/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/device/device_utility.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = UMHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: UMDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: UMSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? UMColors.light : UMColors.dark,
              dotHeight: 6),
        ));
  }
}
