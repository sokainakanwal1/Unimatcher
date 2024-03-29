import 'package:get/get.dart';
import 'package:unimatcher/utils/constants/colors.dart';

class MdcatController extends GetxController {
  final matricMarks = 0.obs;
  final intermediateMarks = 0.obs;
  final entryTestMarks = 0.obs;
  final aggregate = 0.0.obs;

  final int totalMatricMarks = 1100;
  final int totalIntermediateMarks = 1100;
  final int totalEntryTestMarks = 200;

  void calculateAggregate() {
    final matricPercentage = (matricMarks.value / totalMatricMarks) * 10;
    final intermediatePercentage =
        (intermediateMarks.value / totalIntermediateMarks) * 40;
    final entryTestPercentage =
        (entryTestMarks.value / totalEntryTestMarks) * 50;

    aggregate.value =
        matricPercentage + intermediatePercentage + entryTestPercentage;
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

  void setMatricMarks(int marks) {
    checkMarks(marks, totalMatricMarks);
    matricMarks.value = marks;
  }

  void setIntermediateMarks(int marks) {
    checkMarks(marks, totalIntermediateMarks);
    intermediateMarks.value = marks;
  }

  void setEntryTestMarks(int marks) {
    checkMarks(marks, totalEntryTestMarks);
    entryTestMarks.value = marks;
  }
}
