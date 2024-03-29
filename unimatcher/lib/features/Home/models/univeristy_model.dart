import 'package:cloud_firestore/cloud_firestore.dart';

class University {
  final String name;
  final String imageUrl;
  final String hecRanking;
  final String qsRanking;
  final String provinceValue;
  final String sectorValue;
  final String hostelValue;
  final String sportsValue;
  final String coEducationValue;
  final String scholarshipValue;
  final String cityValue;

  University({
    required this.name,
    required this.imageUrl,
    required this.hecRanking,
    required this.qsRanking,
    required this.provinceValue,
    required this.sectorValue,
    required this.hostelValue,
    required this.sportsValue,
    required this.coEducationValue,
    required this.scholarshipValue,
    required this.cityValue,
  });

  factory University.fromFirestore(QueryDocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return University(
      name: data['Name'] ?? '',
      imageUrl: data['imageLink'] ?? '',
      hecRanking: data['HECRanking'] ?? '',
      qsRanking: data['QSRanking'] ?? '',
      provinceValue: data['provinceValue'] ?? '',
      sectorValue: data['sectorValue'] ?? '',
      hostelValue: data['hostelValue'] ?? '',
      sportsValue: data['sportsValue'] ?? '',
      coEducationValue: data['coEducationValue'] ?? '',
      scholarshipValue: data['scholarshipValue'] ?? '',
      cityValue: data['City'] ?? '',
    );
  }
}
