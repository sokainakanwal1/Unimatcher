import 'package:flutter/material.dart';
import 'package:unimatcher/utils/theme/widget_themes/appbar_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/chip_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/text_field_theme.dart';
import 'package:unimatcher/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class UMAppTheme {
  UMAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: UMColors.grey,
    brightness: Brightness.light,
    primaryColor: UMColors.primary,
    textTheme: UMTextTheme.lightTextTheme,
    chipTheme: UMChipTheme.lightChipTheme,
    scaffoldBackgroundColor: UMColors.white,
    appBarTheme: UMAppBarTheme.lightAppBarTheme,
    checkboxTheme: UMCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: UMBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: UMElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: UMOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: UMTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: UMColors.grey,
    brightness: Brightness.dark,
    primaryColor: UMColors.primary,
    textTheme: UMTextTheme.darkTextTheme,
    chipTheme: UMChipTheme.darkChipTheme,
    scaffoldBackgroundColor: UMColors.black,
    appBarTheme: UMAppBarTheme.darkAppBarTheme,
    checkboxTheme: UMCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: UMBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: UMElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: UMOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: UMTextFormFieldTheme.darkInputDecorationTheme,
  );
}
