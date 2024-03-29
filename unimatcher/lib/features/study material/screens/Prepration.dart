import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:unimatcher/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/features/Home/screens/cities_universities.dart';
import 'package:unimatcher/features/aggregate%20calculator/screens/widgets/calculator_card.dart';
import 'package:unimatcher/features/study%20material/screens/chatbot/chat_page.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/ECAT%20SUBJECT/ecat_subject_card.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/MDCAT%20SUBJECTS/mdcat_subject_card.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/NTS%20SUBJECT/nts_subjects.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/NUMS%20SUBJECTS/nums_subject_card.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UMHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  UMSizes.defaultSpace * 0.4,
                  UMSizes.defaultSpace,
                  UMSizes.defaultSpace * 0.4,
                  UMSizes.defaultSpace),
              child: Text(
                'Get Ready to Prepare for Entry Test!📚📑',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: dark ? UMColors.white : UMColors.primary,
                    fontSizeDelta: 7),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(
                  UMSizes.defaultSpace,
                  UMSizes.defaultSpace * 0.1,
                  UMSizes.defaultSpace * 0.4,
                  UMSizes.defaultSpace),
              child: UMSectionHeading(title: 'Popular Cities'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  UMSizes.defaultSpace,
                  UMSizes.defaultSpace * 0.1,
                  UMSizes.defaultSpace * 0.4,
                  UMSizes.defaultSpace),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return VerticalImageText(
                          image: UMImages.lahore,
                          title: 'Lahore',
                          // onTap: () => Get.to(() => const CitiesUniversities()),
                          textColor: dark ? UMColors.white : UMColors.primary,
                          backgroundColor: dark
                              ? UMColors.primary.withOpacity(0.6)
                              : const Color(0xFFe29578));
                    }),
              ),
            ),

            ///Cards
            CalculatorCard(
              imagePath: UMImages.mdcatIcon,
              title: '  MDCAT',
              onPressed: () => Get.to(() => const MDCATSubjectCard()),
            ),
            CalculatorCard(
              imagePath: UMImages.ecatIcon,
              title: '  ECAT',
              onPressed: () => Get.to(() => const ECATSubjectCard()),
            ),
            CalculatorCard(
              imagePath: UMImages.book1,
              title: '  NTS',
              onPressed: () => Get.to(() => const NTSSubjectCard()),
            ),
            CalculatorCard(
              imagePath: UMImages.book2,
              title: '  NUMS',
              onPressed: () => Get.to(() => const NUMSSubjectCard()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color(0xFFe29578),
          icon: Icon(Icons.chat),
          label: Text("Chat"),
          tooltip: 'Connet to ChatBot',
          onPressed: () => Get.to(() => const ChatScreen())),
    );
  }
}
