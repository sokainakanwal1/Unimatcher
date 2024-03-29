import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/images/rounded_image.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/ircularcomtainer.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristyshadow.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';
import 'package:unimatcher/features/Home/models/univeristy_model.dart';

import 'package:flutter/material.dart';

import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class UniversityCard extends StatelessWidget {
  final University university;

  UniversityCard({required this.university});

  @override
  Widget build(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        // boxShadow: UMColors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
        color: dark ? UMColors.darkGrey : UMColors.white,
      ),
      child: Column(
        children: [
          // Image and favorite button
          _buildImageSection(context),
          const SizedBox(height: UMSizes.spaceBtwItems / 2),
          // Details
          _buildDetailsSection(context),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return CircularContainer(
      height: 180,
      padding: const EdgeInsets.all(UMSizes.sm),
      backgroundColor: dark ? UMColors.dark : UMColors.light,
      child: Stack(
        children: [
          // University Image
          RoundedImage(imageUrl: university.imageUrl, applyImageRadius: true),
          // Favorite Icon Button
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: dark
                    ? UMColors.black.withOpacity(0.9)
                    : UMColors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  // Add your favorite functionality here
                },
                icon: const Icon(Icons.favorite, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: UMSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            university.name,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: UMSizes.spaceBtwItems / 2),
          Row(
            children: [
              Text(
                university.sectorValue,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(width: UMSizes.xs),
              const Icon(Icons.verified_user,
                  color: UMColors.primary, size: UMSizes.iconXs),
            ],
          ),
        ],
      ),
    );
  }
}
