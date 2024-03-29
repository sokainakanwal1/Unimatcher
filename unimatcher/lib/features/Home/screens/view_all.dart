import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/layout/university_grid_layout.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristycard.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class AllUniversities extends StatelessWidget {
  const AllUniversities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UMAppBar(
        title: Text('All Universities'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UMSizes.defaultSpace),
          child: Column(children: [
            //Drop down

            DropdownButtonFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              onChanged: (value) {},
              items: [
                'Public',
                'Private',
                'Sports Based Addmission',
                'Transport Facility'
              ]
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections,
            ),

            ///Universities
            // UMGridLayout(
            //     itemCount: 8, itemBuilder: (_, index) => const UniversityCard())
          ]),
        ),
      ),
    );
  }
}
