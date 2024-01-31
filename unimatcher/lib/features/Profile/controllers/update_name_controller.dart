import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/data/repositories/user/user_repository.dart';
import 'package:unimatcher/features/Profile/controllers/users_controller.dart';
import 'package:unimatcher/features/Profile/screens/profile_screen.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/helpers/network_manager.dart';
import 'package:unimatcher/utils/popups/full_screen_loader.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userConteroller = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userConteroller.user.value.firstName;
    lastName.text = userConteroller.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are updating your information...', UMImages.decorAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //Update user's first and last name in the firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //Update the Rx User value
      userConteroller.user.value.firstName = firstName.text.trim();
      userConteroller.user.value.lastName = lastName.text.trim();

      //Remove Loader
      FullScreenLoader.stopLoading();

      //Show Success message
      UMLoaders.successSnackBar(
          title: 'Congratualtions', message: 'Your Name has been updated.');

      //Move to Previous Screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      UMLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
