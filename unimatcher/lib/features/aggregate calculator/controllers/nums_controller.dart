import 'package:get/get.dart';
import 'package:unimatcher/utils/constants/colors.dart';

class NumsController extends GetxController {
  final entryTestMarks = 0.obs;
  final intermediateMarks = 0.obs;
  final matricMarks = 0.obs;
  final aggregate = 0.0.obs;

  final int totalNumsMdcatMarks = 180;
  final int totalIntermediateMarks = 1100;
  final int totalMatricMarks = 1100;

  void calculateAggregate() {
    final numsMdcatPercentage =
        (entryTestMarks.value / totalNumsMdcatMarks) * 50;
    final intermediatePercentage =
        (intermediateMarks.value / totalIntermediateMarks) * 40;
    final matricPercentage = (matricMarks.value / totalMatricMarks) * 10;

    aggregate.value =
        numsMdcatPercentage + intermediatePercentage + matricPercentage;
  }

  void checkMarks(int marks, int totalMarks) {
    if (marks > totalMarks) {
      Get.snackbar(
        "Error",
        "Marks can't be greater than total marks",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: UMColors.warning,
        colorText: UMColors.white,
      );
    }
  }

  void setEntryTestMarks(int marks) {
    checkMarks(marks, totalNumsMdcatMarks);
    entryTestMarks.value = marks;
  }

  void setIntermediateMarks(int marks) {
    checkMarks(marks, totalIntermediateMarks);
    intermediateMarks.value = marks;
  }

  void setMatricMarks(int marks) {
    checkMarks(marks, totalMatricMarks);
    matricMarks.value = marks;
  }
}
