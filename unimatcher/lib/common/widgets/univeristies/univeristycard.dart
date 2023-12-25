import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/images/rounded_image.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/ircularcomtainer.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristyshadow.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class UniversityCard extends StatelessWidget {
  const UniversityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [UniversityStyle.univeristyshadow],
          borderRadius: BorderRadius.circular(TSizes.univeristyImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(children: [
          ///Image + wishlist button
          CircularContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///Image
                  const RoundedImage(
                    imageUrl: TImages.riphahUni,
                    applyImageRadius: true,
                  ),

                  ////--Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: dark
                              ? TColors.black.withOpacity(0.9)
                              : TColors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.heart5,
                            color: Colors.red,
                          )),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),

          ///--Details
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Riphah International Univeristy',
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Row(
                  children: [
                    Text(
                      'Private',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    const Icon(
                      Iconsax.verify5,
                      color: TColors.primary,
                      size: TSizes.iconXs,
                    )
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
