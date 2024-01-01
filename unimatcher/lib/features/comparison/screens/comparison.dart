import 'package:flutter/material.dart';
import 'package:unimatcher/features/comparison/screens/widgets/degree_dropdown.dart';
import 'package:unimatcher/features/comparison/screens/widgets/dropDown.dart';
import 'package:unimatcher/features/comparison/screens/widgets/table.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class UniversityComparisonScreen extends StatelessWidget {
  const UniversityComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Text(
                'Compare Universities',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: TColors.primary, fontSizeDelta: 10),
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
