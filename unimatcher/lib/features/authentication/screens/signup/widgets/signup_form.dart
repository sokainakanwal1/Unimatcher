import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/authentication/controllers/signup/signup_controller.dart';
import 'package:unimatcher/features/authentication/screens/signup/verify_email.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';
import 'package:unimatcher/utils/validators/validation.dart';

class SignUPForm extends StatelessWidget {
  const SignUPForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final dark = UMHelperFunctions.isDarkMode(context);
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        UMValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: UMTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(
                  width: UMSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        UMValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: UMTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(
                  height: UMSizes.spaceBtwInputFields,
                ),
              ],
            ),
            const SizedBox(
              height: UMSizes.spaceBtwInputFields,
            ),

            ///UserName
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  UMValidator.validateEmptyText('Username', value),
              expands: false,
              decoration: const InputDecoration(
                labelText: UMTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwInputFields,
            ),

            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value) => UMValidator.validateEmail(value),
              decoration: const InputDecoration(
                labelText: UMTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwInputFields,
            ),

            ///Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => UMValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                labelText: UMTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwInputFields,
            ),

            ///Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => UMValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: UMTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    )),
              ),
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections,
            ),

            ///Terms and COnditions checkBox
            Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(() => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) => controller.privacyPolicy.value =
                            !controller.privacyPolicy.value))),
                const SizedBox(
                  width: UMSizes.spaceBtwItems,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: ' ${UMTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.labelSmall),
                  TextSpan(
                      text: '${UMTexts.privacyPolicy} ',
                      style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? UMColors.white : UMColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? UMColors.white : UMColors.primary)),
                  TextSpan(
                      text: ' ${UMTexts.and} ',
                      style: Theme.of(context).textTheme.labelSmall),
                  TextSpan(
                      text: ' ${UMTexts.termsOfUse} ',
                      style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? UMColors.white : UMColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? UMColors.white : UMColors.primary)),
                ]))
              ],
            ),
            const SizedBox(
              height: UMSizes.spaceBtwSections,
            ),

            ///Signup Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(UMTexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
