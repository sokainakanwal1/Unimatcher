import 'package:flutter/material.dart';
import 'package:unimatcher/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class UMAppBarTheme {
  UMAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: UMColors.black, size: UMSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: UMColors.black, size: UMSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: UMColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: UMColors.black, size: UMSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: UMColors.white, size: UMSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: UMColors.white),
  );
}
