import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/layout/university_grid_layout.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristycard.dart';
import 'package:unimatcher/features/prefrence%20match/screens/widgets/row1.dart';
import 'package:unimatcher/features/prefrence%20match/screens/widgets/row2.dart';
import 'package:unimatcher/features/prefrence%20match/screens/widgets/row3.dart';
import 'package:unimatcher/features/prefrence%20match/screens/widgets/row4.dart';
import 'package:unimatcher/features/prefrence%20match/screens/widgets/row5.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class PrefrenceMatch extends StatelessWidget {
  const PrefrenceMatch({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UMAppBar(
        title: Text('Filters'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20, // Adjust the top padding as needed
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    UMSizes.defaultSpace * 0.1,
                    UMSizes.defaultSpace,
                    UMSizes.defaultSpace * 0.4,
                    UMSizes.defaultSpace),
                child: Text(
                  'Match Your Preference Here!...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: UMColors.primary, fontSizeDelta: 3),
                ),
              ),
              const SizedBox(
                height: UMSizes.spaceBtwSections * 0.3,
              ),

              ////--Row 1 DropDowns -> Sector, City
              const Row1(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const Row2(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const Row3(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const Row4(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const Row5(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const Padding(
                padding: EdgeInsets.all(UMSizes.defaultSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UMSectionHeading(
                        title: 'Matching Results', textColor: UMColors.black),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UMGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => const UniversityCard()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
