import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/data/repositories/Authentication/Authentication/authenticationrepository.dart';
import 'package:unimatcher/data/repositories/user/user_repository.dart';
import 'package:unimatcher/features/Profile/models/user_model.dart';
import 'package:unimatcher/features/authentication/screens/signup/verify_email.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/helpers/network_manager.dart';
import 'package:unimatcher/utils/popups/full_screen_loader.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variabless
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation

  //----SIGNUP
  void signup() async {
    try {
      //Start Loading

      FullScreenLoader.openLoadingDialog(
          'We are processing your information...', UMImages.decorAnimation);
      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      //Privacy Policy Check

      if (!privacyPolicy.value) {
        UMLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In Order to create account, you must have to read and accept the Privacy Policy and Terms of Use.');
        return;
      }
      //Register user in the Firebase Authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //Save Autheticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      FullScreenLoader.stopLoading();

      //Show Success Message
      UMLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      //Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoading();
      //Show some Generic error to the user

      UMLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
