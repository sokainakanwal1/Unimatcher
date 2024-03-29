import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/common/images/rounded_image.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/primary_header_container.dart';
import 'package:unimatcher/common/widgets/layout/university_grid_layout.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristycard.dart';
import 'package:unimatcher/features/Home/controllers/home_screen_controller.dart';

import 'package:unimatcher/features/Home/screens/view_all.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  final UniversityController _homeController = Get.put(UniversityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(),

            ///Body -- Sliders ---
            Padding(
              padding: const EdgeInsets.all(UMSizes.defaultSpace),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(viewportFraction: 1),
                    items: const [
                      RoundedImage(
                        imageUrl: UMImages.promoBanner1,
                      ),
                      RoundedImage(
                        imageUrl: UMImages.promoBanner1,
                      ),
                      RoundedImage(
                        imageUrl: UMImages.promoBanner1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: UMSizes.spaceBtwItems,
                  ),

                  ///---Universities
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const UMSectionHeading(
                          title: 'All Universities', textColor: UMColors.black),
                      TextButton(
                          onPressed: () =>
                              Get.to(() => const AllUniversities()),
                          child: const Text('View All'))
                    ],
                  ),
                  Obx(
                    () {
                      if (_homeController.universities.isEmpty) {
                        return CircularProgressIndicator(); // Or any loading widget
                      } else {
                        return UMGridLayout(
                          itemCount: _homeController.universities.length,
                          itemBuilder: (_, index) => UniversityCard(
                            university: _homeController.universities[index],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
