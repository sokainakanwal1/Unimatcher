import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/Subjects/subjects_card.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class MDCATSubjectCard extends StatelessWidget {
  const MDCATSubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const UMAppBar(
          title: Text('MDCAT SUBJECTS'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: UMSizes.defaultSpace),
              child: Text(
                'Study Material For MDCAT',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: UMColors.primary, fontSizeDelta: 6),
              ),
            ),
            const SizedBox(height: 20),
            const SubjectCard(
              subID: 'biology',
              subImage: UMImages.bioIcon,
              subTitle: 'Biology',
            ),
            const SubjectCard(
              subID: 'chemistry',
              subImage: UMImages.chemIcon,
              subTitle: 'Chemistry',
            ),
            const SubjectCard(
              subID: 'physics',
              subImage: UMImages.phyIcon,
              subTitle: 'Physics',
            ),
            const SubjectCard(
              subID: 'english',
              subImage: UMImages.engIcon,
              subTitle: 'English',
            ),
            const SubjectCard(
              subID: 'logic',
              subImage: UMImages.logicIcon,
              subTitle: 'Logic Reasoning',
            ),
          ]),
        ));
  }
}
