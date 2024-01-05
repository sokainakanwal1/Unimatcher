import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class UMChipTheme {
  UMChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: UMColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: UMColors.black),
    selectedColor: UMColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: UMColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: UMColors.darkerGrey,
    labelStyle: TextStyle(color: UMColors.white),
    selectedColor: UMColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: UMColors.white,
  );
}
