import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import 'package:unimatcher/features/authentication/controllers/login/login_controller.dart';
import 'package:unimatcher/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:unimatcher/features/authentication/screens/signup/signup.dart';
import 'package:unimatcher/navigation_menu.dart';

import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/validators/validation.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: UMSizes.spaceBtwSections),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator: (value) => UMValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UMTexts.email),
              ),
              const SizedBox(height: UMSizes.spaceBtwInputFields),

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
              const SizedBox(height: UMSizes.spaceBtwInputFields / 2),

              ///Remember Me and Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Remember Me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value =
                                !controller.rememberMe.value),
                      ),
                      const Text(UMTexts.rememberMe),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: UMSizes.spaceBtwSections,
              ),

              ///Sign in Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: const Text(UMTexts.signIn))),

              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),

              ///Create Account Button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignupScreen()),
                      child: const Text(UMTexts.createAccount))),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
            ],
          ),
        ));
  }
}
