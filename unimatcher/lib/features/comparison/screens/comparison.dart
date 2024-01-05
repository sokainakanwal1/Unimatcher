import 'package:flutter/material.dart';
import 'package:unimatcher/features/comparison/screens/widgets/degree_dropdown.dart';
import 'package:unimatcher/features/comparison/screens/widgets/dropDown.dart';
import 'package:unimatcher/features/comparison/screens/widgets/table.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class UniversityComparisonScreen extends StatelessWidget {
  const UniversityComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UMSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  UMSizes.defaultSpace * 0.4,
                  UMSizes.defaultSpace,
                  UMSizes.defaultSpace * 0.4,
                  UMSizes.defaultSpace),
              child: Text(
                'Compare Universities',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: dark ? UMColors.white : UMColors.primary,
                    fontSizeDelta: 7),
              ),
            ),
            const SizedBox(height: 10),
            const UMDropDown(),
            const DegreeDropDown(),
            const UMDropDown(),
            const DegreeDropDown(),
            UMTable()
          ]),
        ),
      ),
    );
  }
}
