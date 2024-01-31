import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/data/repositories/Authentication/Authentication/authenticationrepository.dart';
import 'package:unimatcher/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/helpers/network_manager.dart';
import 'package:unimatcher/utils/popups/full_screen_loader.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Vairables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  //Send Reset Passowrd Email
  sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', UMImages.decorAnimation);

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!forgetPasswordKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //for authentication
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      FullScreenLoader.stopLoading();

      //Show Success Screen
      UMLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      //Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      //Remove Loader
      FullScreenLoader.stopLoading();
      UMLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', UMImages.decorAnimation);

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //for authentication
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      FullScreenLoader.stopLoading();

      //Show Success Screen
      UMLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      //Remove Loader
      FullScreenLoader.stopLoading();
      UMLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
