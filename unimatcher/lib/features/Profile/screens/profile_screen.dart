import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/images/rounded_image.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/text/sectionheading.dart';
import 'package:unimatcher/features/Profile/screens/widgets/profile_menu.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UMAppBar(
        title: Text('Profile'),
      ),

      ///--Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const RoundedImage(
                      imageUrl: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const UMSectionHeading(title: 'Profile Information'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              UMProfileMenu(
                title: 'Name',
                value: 'Sokaina kanwal',
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'Username',
                value: 'Sokaina_kanwal',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //Heading personal Information
              const UMSectionHeading(title: 'Personal Information'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              UMProfileMenu(
                title: 'User ID',
                value: '25582',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'E-mail',
                value: 'Sokainakanwal1@gmail.com',
                onPressed: () {},
              ),
              UMProfileMenu(
                title: 'Phone Number',
                value: '03234252937',
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
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () {},
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
