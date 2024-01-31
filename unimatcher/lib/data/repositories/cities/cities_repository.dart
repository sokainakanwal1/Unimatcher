import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:unimatcher/data/service/firebase_storage_service.dart';
import 'package:unimatcher/features/Home/models/cities_model.dart';
import 'package:unimatcher/utils/exceptions/firebase_exceptions.dart';
import 'package:unimatcher/utils/exceptions/format_exceptions.dart';
import 'package:unimatcher/utils/exceptions/platform_exceptions.dart';

class CitiesRepository extends GetxController {
  static CitiesRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //Get all cities
  Future<List<CitiesModel>> getAllCities() async {
    try {
      //snapshot=Collection of data
      final snapshot = await _db.collection('Cities').get();
      final list = snapshot.docs
          .map((document) => CitiesModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw UMFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw UMPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  //Upload Cities to  the Cloud Firestore
  // Future<void> uploadDummyData(List<CitiesModel> cities) async {
  //   try {
  //     //Upload all the Cities along with their Images
  //     final Storage = Get.put(UMFirebaseStorageService());
  //   } on FirebaseException catch (e) {
  //     throw UMFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw UMPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong, Please try again';
  //   }
  // }
}
