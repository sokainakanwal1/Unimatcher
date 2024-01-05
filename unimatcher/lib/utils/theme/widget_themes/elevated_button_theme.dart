import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class UMElevatedButtonTheme {
  UMElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UMColors.light,
      backgroundColor: UMColors.primary,
      disabledForegroundColor: UMColors.darkGrey,
      disabledBackgroundColor: UMColors.buttonDisabled,
      side: const BorderSide(color: UMColors.primary),
      padding: const EdgeInsets.symmetric(vertical: UMSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: UMColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UMSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UMColors.light,
      backgroundColor: UMColors.primary,
      disabledForegroundColor: UMColors.darkGrey,
      disabledBackgroundColor: UMColors.darkerGrey,
      side: const BorderSide(color: UMColors.primary),
      padding: const EdgeInsets.symmetric(vertical: UMSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: UMColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UMSizes.buttonRadius)),
    ),
  );
}
