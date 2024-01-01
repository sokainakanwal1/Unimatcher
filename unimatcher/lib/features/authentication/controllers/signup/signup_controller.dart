import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variabless
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation

  //----SIGNUP
  Future<void> signup() async {
    try {
      //Start Loading
      // Check Internet Connectivity
      //Form Validation
      //Privacy Policy Check
      //Register user in the Firebase Authentication & Save user data in the firebase
      //Save Autheticated user data in the Firebase Firestore
      //Show Success Message
      //Move to Verify Email Screen
    } catch (e) {
      //Show some Generic error to the user
    } finally {
      // Remove Loader
    }
  }
}
