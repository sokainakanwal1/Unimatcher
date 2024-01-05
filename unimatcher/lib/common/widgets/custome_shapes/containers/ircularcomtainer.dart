import 'package:flutter/material.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = UMSizes.cardRadiusLg,
    this.margin,
    this.showBorder = false,
    this.padding,
    this.backgroundColor = UMColors.white,
    this.borderColor = UMColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
