import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/images/rounded_image.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/data/repositories/Authentication/Authentication/authenticationrepository.dart';
import 'package:unimatcher/features/Profile/controllers/users_controller.dart';
import 'package:unimatcher/features/Profile/screens/change_name.dart';
import 'package:unimatcher/features/Profile/screens/widgets/profile_menu.dart';
import 'package:unimatcher/features/authentication/controllers/user_controller.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final controller2 = UsersController.instance;
    final controller1 = Get.put(AuthenticationRepository());

    return Scaffold(
      appBar: const UMAppBar(
        title: Text('Profile'),
      ),

      ///--Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UMSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage =
                          controller2.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : UMImages.user;

                      return (controller2.imageUploading.value)
                          ? const CircularProgressIndicator(
                              backgroundColor: UMColors.primary,
                            )
                          : RoundedImage(
                              imageUrl: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller2.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: UMSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const UMSectionHeading(title: 'Profile Information'),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),

              UMProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              UMProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),

              //Heading personal Information
              const UMSectionHeading(title: 'Personal Information'),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              UMProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'Gender',
                value: 'Female',
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'Date of Birth',
                value: '29 Oct,2002',
                onPressed: () {},
              ),

              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () => controller2.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
              const SizedBox(
                height: UMSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () => controller1.logout(),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
