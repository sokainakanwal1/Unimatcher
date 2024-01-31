import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unimatcher/data/repositories/Authentication/Authentication/authenticationrepository.dart';
import 'package:unimatcher/features/authentication/controllers/user_controller.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/helpers/network_manager.dart';
import 'package:unimatcher/utils/popups/full_screen_loader.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UsersController());

//Fetch email and password from local storage
  @override
  void onInit() {
    final storedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final storedPassword = localStorage.read('REMEMBER_ME_PASSWORD');

    email.text =
        storedEmail ?? ''; // Use an empty string if storedEmail is null
    password.text =
        storedPassword ?? ''; // Use an empty string if storedPassword is null

    super.onInit();
  }

  //--Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading

      FullScreenLoader.openLoadingDialog(
          'Loggin you in...', UMImages.decorAnimation);
      // Check Internet Connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Remeber Me is Selcted
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user using email and password authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      FullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      //Show some Generic error to the user
      UMLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Logging you in...', UMImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      ///Google Authentication
      final UserCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      //Save User Record
      await userController.saveUserRecord(UserCredential);

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

      //Remove Loader,
      FullScreenLoader.stopLoading();
    } catch (e) {
      FullScreenLoader.stopLoading();
      UMLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
