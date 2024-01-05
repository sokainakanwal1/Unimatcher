import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/features/Profile/controllers/update_name_controller.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: UMAppBar(
        showBackArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(UMSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections,
            ),
            //Text Field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        UMValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: UMTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections,
            ),
            //save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
