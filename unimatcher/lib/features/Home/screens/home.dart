import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/common/images/rounded_image.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/primary_header_container.dart';
import 'package:unimatcher/common/widgets/layout/university_grid_layout.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristycard.dart';
import 'package:unimatcher/features/Home/screens/view_all.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(),

            ///Body -- Sliders ---
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(viewportFraction: 1),
                      items: const [
                        RoundedImage(
                          imageUrl: TImages.promoBanner1,
                        ),
                        RoundedImage(
                          imageUrl: TImages.promoBanner1,
                        ),
                        RoundedImage(
                          imageUrl: TImages.promoBanner1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///---Universities
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UMSectionHeading(
                            title: 'All Universities',
                            textColor: TColors.black),
                        TextButton(
                            onPressed: () =>
                                Get.to(() => const AllUniversities()),
                            child: const Text('View All'))
                      ],
                    ),
                    UMGridLayout(
                        itemCount: 6,
                        itemBuilder: (_, index) => const UniversityCard()),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
