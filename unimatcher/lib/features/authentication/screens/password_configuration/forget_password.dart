import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:unimatcher/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(UMSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Heading
            Text(
              UMTexts.forgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: UMSizes.spaceBtwItems,
            ),
            Text(
              UMTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections * 2,
            ),

            ///Text Field
            Form(
              key: controller.forgetPasswordKey,
              child: TextFormField(
                controller: controller.email,
                validator: UMValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: UMTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections,
            ),

            ///Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(UMTexts.submit)))
          ],
        ),
      ),
    );
  }
}
