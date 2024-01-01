import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/Subjects/subjects_card.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class NTSSubjectCard extends StatelessWidget {
  const NTSSubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const UMAppBar(
          title: Text('NTS SUBJECTS'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace),
              child: Text(
                'Study Material For NTS',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: TColors.primary, fontSizeDelta: 6),
              ),
            ),
            const SizedBox(height: 20),
            const SubjectCard(
              subID: 'maths',
              subImage: TImages.mathsIcon,
              subTitle: 'Mathmetics',
            ),
            const SubjectCard(
              subID: 'physics',
              subImage: TImages.phyIcon,
              subTitle: 'Physics',
            ),
            const SubjectCard(
              subID: 'analytics',
              subImage: TImages.analyticsIcon,
              subTitle: 'Analytics',
            ),
            const SubjectCard(
              subID: 'quantative',
              subImage: TImages.quantativeIcon,
              subTitle: 'Quantative',
            ),
            const SubjectCard(
              subID: 'english',
              subImage: TImages.engIcon,
              subTitle: 'English',
            ),
            const SubjectCard(
              subID: 'cs',
              subImage: TImages.csIcon,
              subTitle: 'Computer Science',
            ),
          ]),
        ));
  }
}
