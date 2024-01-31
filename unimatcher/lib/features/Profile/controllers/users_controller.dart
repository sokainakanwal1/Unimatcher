import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unimatcher/data/repositories/user/user_repository.dart';
import 'package:unimatcher/features/Profile/models/user_model.dart';
import 'package:unimatcher/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRespository = Get.put(UserRepository());

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        //Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        //Save user Data
        await userRespository.saveUserRecord(user);
      }
    } catch (e) {
      UMLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information, You can re-save your data in your Profile');
    }
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRespository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }
}
