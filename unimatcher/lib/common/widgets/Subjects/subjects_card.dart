import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/study%20material/screens/widgets/MDCAT%20SUBJECTS/bio_mcqs.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subImage,
    required this.subTitle,
    required this.subID,
  });
  final String subImage;
  final String subTitle;
  final String subID;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        color: TColors.primary.withOpacity(0.9),
        margin: const EdgeInsets.all(19.0),
        elevation: 5,
        shadowColor: TColors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29.0),
                  border: Border.all(
                    color: Colors.white, // Set your desired border color
                    width: 1.0, // Set the width of the border
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    subImage,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Expanded(
                flex: 1,
                child: Text(subTitle,
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: Colors.white,
                        )),
              ),
              const Icon(
                Iconsax.document,
                size: 10,
                color: Colors.white,
              ),
              GestureDetector(
                child: Text('Notes',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: Colors.white,
                        )),
              ),
              const SizedBox(
                width: TSizes.defaultSpace,
              ),
              const Icon(
                Iconsax.document_code_2,
                size: 10,
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const BiologyMcqs()),
                child: Text('Mcqs',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: Colors.white,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
