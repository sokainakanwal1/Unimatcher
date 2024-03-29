import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unimatcher/data/repositories/user/user_repository.dart';
import 'package:unimatcher/features/authentication/screens/login/login.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/onboadring.dart';
import 'package:unimatcher/features/authentication/screens/signup/verify_email.dart';
import 'package:unimatcher/navigation_menu.dart';
import 'package:unimatcher/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:unimatcher/utils/exceptions/firebase_exceptions.dart';
import 'package:unimatcher/utils/exceptions/format_exceptions.dart';
import 'package:unimatcher/utils/exceptions/platform_exceptions.dart';
import 'package:unimatcher/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Get Authentication User Data
  User? get authUser => _auth.currentUser;

  //Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show Relevant Screen
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        //Initialize User Specific Storage
        await UMLocalStorage.init(user.uid);
        Future.delayed(const Duration(milliseconds: 50), () {
          Get.offAll(() => const NavigationMenu());
        });
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
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

  /* ------------------------------------Email and Password Sign in---------------------------------*/
  ///EmailAuthentication -SignIn
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///EmailAuthentication -SignIn for Admin
  Future<UserCredential> adminLoginWithEmailAndPassword(
      String username, String password) async {
    try {
      // Query Firestore collection 'Admin' to find a document with matching username and password
      QuerySnapshot querySnapshot = await _firestore
          .collection('Admin')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // If there is a document matching the provided credentials, sign in
        return await _auth.signInWithEmailAndPassword(
            email: username, password: password);
      } else {
        // If no matching document found, throw an exception indicating invalid admin credentials
        throw UMFirebaseAuthException('invalid-credentials').message;
      }
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///Email Authentication- REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///Email Verification - MAIN VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///ReAuthenticate- ReAuthenticate User
  Future<void> reAuthenticationWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      //Re Authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///Email Authentication- Forget Password

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  /*--------------------Federated identity and SOcial sign-in-----------------------*/
  ///GoogleAuthentication- Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger The authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //Obtain the auth details from the request

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      //Once signed in.return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///FacebokAuthentication- Facebokk
  /*--------------------./end Federated identity and social sign-in--------------------*/

  ///Logout User- Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.off(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  ///Delete User- Remove user Auth and firebase account.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw UMFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const UMFormatException();
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
