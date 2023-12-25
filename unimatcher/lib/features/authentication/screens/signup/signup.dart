import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/login/form_divider.dart';
import 'package:unimatcher/common/widgets/login/social_buttons.dart';
import 'package:unimatcher/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///title
                  Text(TTexts.signupTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Form
                  const SignUPForm(),

                  ///Divider
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TDivider(dividerText: TTexts.orSignUpWith),

                  ///Social Buttons/ Footer
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Footer(),
                ],
              ))),
    );
  }
}
