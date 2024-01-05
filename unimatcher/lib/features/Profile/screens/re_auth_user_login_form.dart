import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/features/authentication/controllers/user_controller.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/validators/validation.dart';

class ReAuthLoginFrom extends StatelessWidget {
  const ReAuthLoginFrom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UsersController.instance;
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
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: UMValidator.validateEmail,
                    decoration: const InputDecoration(
                        labelText: UMTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(
                    height: UMSizes.spaceBtwInputFields,
                  ),

                  //password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          UMValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                          labelText: UMTexts.password,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: const Icon(Iconsax.eye_slash))),
                    ),
                  ),
                  const SizedBox(
                    height: UMSizes.spaceBtwSections,
                  ),

                  //save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text('Verify')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
