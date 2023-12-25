import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/ircularcomtainer.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/search_container.dart';
import 'package:unimatcher/common/widgets/custome_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:unimatcher/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/features/Home/screens/cities_universities.dart';
import 'package:unimatcher/features/Home/screens/wishlist/wishlist.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: SizedBox(
        height: 350,
        child: Container(
          color: TColors.primary,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                right: -150,
                child: CircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 150,
                right: -200,
                child: CircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),

              ////*Custom App Bar and Search Bar */
              Column(
                children: [
                  UMAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.homeAppbarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.grey),
                        ),
                        Text(
                          TTexts.homeAppbarSubTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.white),
                        )
                      ],
                    ),
                    actions: [
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const FavouriteScreen()),
                          icon: const Icon(
                            Iconsax.heart4,
                            color: TColors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SearchContainer(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const UMSectionHeading(
                            title: 'Popular Cities', textColor: TColors.white),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///Popular Cities
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return VerticalImageText(
                                  image: TImages.lahore,
                                  title: 'Lahore',
                                  onTap: () =>
                                      Get.to(() => const CitiesUniversities()),
                                  textColor: TColors.white,
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
