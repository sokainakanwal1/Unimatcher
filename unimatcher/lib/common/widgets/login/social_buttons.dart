import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:unimatcher/features/authentication/controllers/login/login_controller.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: UMColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                onPressed: () => controller.googleSignIn(),
                icon: const Image(
                  width: UMSizes.iconMd,
                  height: UMSizes.iconMd,
                  image: AssetImage(UMImages.google),
                ))),
        const SizedBox(
          width: UMSizes.spaceBtwItems,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: UMColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                onPressed: () {},
                icon: const Image(
                  width: UMSizes.iconMd,
                  height: UMSizes.iconMd,
                  image: AssetImage(UMImages.facebook),
                ))),
      ],
    );
  }
}
