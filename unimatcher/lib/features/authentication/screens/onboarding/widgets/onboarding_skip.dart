import 'package:flutter/material.dart';
import 'package:unimatcher/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/device/device_utility.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: UMDeviceUtils.getAppBarHeight(),
        right: UMSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
