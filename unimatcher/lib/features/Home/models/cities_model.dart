import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CitiesModel {
  String id;
  bool isPopular;
  String name;
  String image;
  CitiesModel({
    required this.id,
    required this.isPopular,
    required this.name,
    required this.image,
  });

  ///Empty Helper Function
  static CitiesModel empty() =>
      CitiesModel(id: ' ', image: ' ', name: ' ', isPopular: true);

  //Convert model to json structure so that we can store data in firestore

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  //Map Json oriented document snapshot from Firestore to UserModel
  //create another constructor using factory
  factory CitiesModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      //Map JSON Record to the Model
      return CitiesModel(
        id: document.id,
        name: document['Name'] ?? ' ',
        image: document['Image'] ?? ' ',
        isPopular: true,
      );
    } else {
      return CitiesModel.empty();
    }
  }
}
