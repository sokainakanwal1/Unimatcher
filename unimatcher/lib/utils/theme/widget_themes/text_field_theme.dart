import 'package:flutter/material.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class UMTextFormFieldTheme {
  UMTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: UMColors.darkGrey,
    suffixIconColor: UMColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: UMSizes.fontSizeMd, color: UMColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: UMSizes.fontSizeSm, color: UMColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: UMColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: UMColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: UMColors.darkGrey,
    suffixIconColor: UMColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: UMSizes.fontSizeMd, color: UMColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: UMSizes.fontSizeSm, color: UMColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: UMColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: UMColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(UMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: UMColors.warning),
    ),
  );
}
