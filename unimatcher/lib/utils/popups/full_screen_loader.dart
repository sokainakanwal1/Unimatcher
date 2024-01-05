import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:unimatcher/common/widgets/loader/animation_loader.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/helpers/helper_functions.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: UMHelperFunctions.isDarkMode(Get.context!)
                  ? UMColors.dark
                  : UMColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  UMAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
