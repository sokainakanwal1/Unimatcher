import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unimatcher/data/repositories/Authentication/authenticationrepository.dart';
import 'package:unimatcher/data/repositories/user_model.dart';
import 'package:unimatcher/utils/exceptions/firebase_exceptions.dart';
import 'package:unimatcher/utils/exceptions/format_exceptions.dart';
import 'package:unimatcher/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ////Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  //Function to fetch user deatils based on user Id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  //Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  //Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  // Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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
  //Upload any Image
}
