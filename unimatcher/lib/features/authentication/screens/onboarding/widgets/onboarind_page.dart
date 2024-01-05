import 'package:flutter/material.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UMSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: UMHelperFunctions.screenWidth() * 0.8,
              height: UMHelperFunctions.screenWidth() * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: UMSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
