import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/image_text_widget/um_circular_image.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    required this.textColor,
    this.isNetworkImage = true,
    this.backgroundColor = UMColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: UMSizes.spaceBtwItems),
        child: Column(
          children: [
            //Circular Icon
            UMCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: UMSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: UMHelperFunctions.isDarkMode(context)
                  ? UMColors.light
                  : UMColors.dark,
            ),

            ///Text
            const SizedBox(height: UMSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
