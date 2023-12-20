import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/features/authentication/controllers/onboarding/onboarding_controllers.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/widgets/onboarind_page.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        ///Horizontal Scrollable Pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            onBoardingPage(
              image: TImages.onBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subTitle: TTexts.onBoardingSubTitle1,
            ),
            onBoardingPage(
              image: TImages.onBoardingImage2,
              title: TTexts.onBoardingTitle2,
              subTitle: TTexts.onBoardingSubTitle2,
            ),
            onBoardingPage(
              image: TImages.onBoardingImage3,
              title: TTexts.onBoardingTitle3,
              subTitle: TTexts.onBoardingSubTitle3,
            ),
          ],
        ),

        ///Skip Button
        const onBoardingSkip(),

        ///Dot Navigation SmoothPageIndicator
        const OnBoardingNavigation(),

        ///Circular Button

        const OnBoardingNextButton(),
      ],
    ));
  }
}
