import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/features/Home/controllers/favourites_controller.dart';
import 'package:unimatcher/utils/constants/colors.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Container(
      decoration: BoxDecoration(
          color: dark
              ? UMColors.black.withOpacity(0.9)
              : UMColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.heart5,
            color: Colors.red,
          )),
    );
  }
}
