// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class UMFirebaseStorageService extends GetxController {
//   static UMFirebaseStorageService get instance => Get.find();

//   final _firebaseStorage = FirebaseStorage.instance;

//   ///Upload Local Assest from IDE
//   /////Returns a Uint8List containing image data.
//   Future<Uint8List> getImageDataFromAssets(String path) async {
//     try {
//       final byteData = await rootBundle.load(path);
//       final imageData = byteData.buffer
//           .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
//       return;
//     } catch (e) {}
//   }
// }
