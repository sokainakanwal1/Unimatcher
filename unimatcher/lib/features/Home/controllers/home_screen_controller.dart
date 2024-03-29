import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:unimatcher/features/Home/models/univeristy_model.dart';

class UniversityController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final universities = List<University>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUniversities();
  }

  void fetchUniversities() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('Universities').get();
      if (querySnapshot.docs.isNotEmpty) {
        universities.assignAll(querySnapshot.docs
            .map((doc) => University.fromFirestore(doc))
            .toList());
      }
    } catch (e) {
      print("Error fetching universities: $e");
    }
  }
}
