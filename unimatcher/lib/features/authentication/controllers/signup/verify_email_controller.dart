import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unimatcher/common/widgets/success_screen/success_screen.dart';
import 'package:unimatcher/data/repositories/Authentication/Authentication/authenticationrepository.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send Email whenever verify scrren appears and set time for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAuthoRedirect();
    super.onInit();
  }

  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      UMLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      UMLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAuthoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
              image: UMImages.successfullyRegisterAnimation,
              title: UMTexts.yourAccountCreatedTitle,
              subTitle: UMTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect()),
        );
      }
    });
  }

  //Manually Check if Emailverified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            image: UMImages.successfullyRegisterAnimation,
            title: UMTexts.yourAccountCreatedTitle,
            subTitle: UMTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()),
      );
    }
  }

  //Send Email Verification Link
  //Timer to automatically redirect in Email Verification
  //Manually check if Email verified
}
