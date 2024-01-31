import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unimatcher/data/repositories/Authentication/Authentication/authenticationrepository.dart';
import 'package:unimatcher/data/repositories/user/user_repository.dart';
import 'package:unimatcher/features/Profile/models/user_model.dart';
import 'package:unimatcher/features/Profile/screens/re_auth_user_login_form.dart';
import 'package:unimatcher/features/authentication/screens/login/login.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import 'package:unimatcher/utils/helpers/network_manager.dart';
import 'package:unimatcher/utils/popups/full_screen_loader.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class UsersController extends GetxController {
  static UsersController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Save user record for any registration provider
  Future<void> saveUserRecord(UserCredential? UserCredentials) async {
    try {
      //First Update Rx User and then check if user data is already stored. If not, store new data .

      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (UserCredentials != null) {
          // Convert Name to First and last Name
          final nameParts =
              UserModel.nameParts(UserCredentials.user!.displayName ?? ' ');
          final username = UserModel.generateUsername(
              UserCredentials.user!.displayName ?? ' ');

          //Map Data
          final user = UserModel(
              email: UserCredentials.user!.email ?? ' ',
              id: UserCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
              username: username,
              phoneNumber: UserCredentials.user!.phoneNumber ?? ' ',
              profilePicture: UserCredentials.user!.photoURL ?? ' ');

          //Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      UMLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile');
    }
  }

  //Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(UMSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversable and all of your data will be removed permanently',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: UMSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ));
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing', UMImages.decorAnimation);

      //First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginFrom());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      UMLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //-Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog('Processing', UMImages.decorAnimation);

      ///Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticationWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      UMLoaders.warningSnackBar(title: 'Oh,Snap!', message: e.toString());
    }
  }

  //Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageurl =
            await userRepository.uploadImage('Users/Images/Profile', image);

        ///Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageurl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageurl;
        user.refresh();

        UMLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      UMLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
