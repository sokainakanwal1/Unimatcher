import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/calculator_card.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/inputMarks.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/ECAT%20SUBJECT/ecat_subject_card.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/MDCAT%20SUBJECTS/mdcat_subject_card.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/NTS%20SUBJECT/nts_subjects.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/NUMS%20SUBJECTS/nums_subject_card.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: Text(
              'Get Ready to Prepare for Entry Test!',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: TColors.primary, fontSizeDelta: 8),
            ),
          ),
          const SizedBox(height: 20),

          ///Cards
          CalculatorCard(
            imagePath: TImages.mdcatIcon,
            title: '  MDCAT',
            onPressed: () => Get.to(() => const MDCATSubjectCard()),
          ),
          CalculatorCard(
            imagePath: TImages.ecatIcon,
            title: '  ECAT',
            onPressed: () => Get.to(() => const ECATSubjectCard()),
          ),
          CalculatorCard(
            imagePath: TImages.book1,
            title: '  NTS',
            onPressed: () => Get.to(() => const NTSSubjectCard()),
          ),
          CalculatorCard(
            imagePath: TImages.book2,
            title: '  NUMS',
            onPressed: () => Get.to(() => const NUMSSubjectCard()),
          ),
        ],
      ),
    ));
  }
}
