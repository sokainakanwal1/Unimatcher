import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/ircularcomtainer.dart';
import 'package:unimatcher/common/widgets/custome_shapes/containers/primary_header_container.dart';
import 'package:unimatcher/features/Home/screens/wishlist/wishlist.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Container(
                color: TColors.primary,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      right: -150,
                      child: CircularContainer(
                        backgroundColor: TColors.textWhite.withOpacity(0.1),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      right: -200,
                      child: CircularContainer(
                        backgroundColor: TColors.textWhite.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///--Header

            ///Body or Settings
          ],
        ),
      ),
    );
  }
}
