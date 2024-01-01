import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unimatcher/features/authentication/screens/login/login.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/onboadring.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();

  //Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show Relevant Screen
  screenRedirect() async {
    if (kDebugMode) {
      print('====================GET STORAGE NEXT BUTTON =================');
      print(deviceStorage.read('isFirstTime'));
    }
    //Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);

    if (kDebugMode) {
      print('====================GET STORAGE NEXT BUTTON =================');
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}
