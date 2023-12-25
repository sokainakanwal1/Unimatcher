import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/common/styles/spacing_style.dart';
import 'package:unimatcher/common/widgets/login/form_divider.dart';
import 'package:unimatcher/common/widgets/login/social_buttons.dart';
import 'package:unimatcher/features/authentication/screens/login/widgets/login_form.dart';
import 'package:unimatcher/features/authentication/screens/login/widgets/login_header.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: TSpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  children: [
                    ///Logo,Title and Sub Title
                    LoginHeader(dark: dark),

                    ///Input Form
                    const InputForm(),

                    ///Divider
                    TDivider(dividerText: TTexts.orSignInWith.capitalize!),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    ///Footer
                    const Footer(),
                  ],
                ))));
  }
}
