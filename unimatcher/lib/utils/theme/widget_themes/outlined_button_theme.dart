import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class UMOutlinedButtonTheme {
  UMOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: UMColors.dark,
      side: const BorderSide(color: UMColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: UMColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: UMSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UMSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: UMColors.light,
      side: const BorderSide(color: UMColors.borderPrimary),
      textStyle: const TextStyle(
          fontSize: 16, color: UMColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: UMSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UMSizes.buttonRadius)),
    ),
  );
}
