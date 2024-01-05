import 'package:flutter/material.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class UMGridLayout extends StatelessWidget {
  const UMGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtend = 245,
      required this.itemBuilder});

  final int itemCount;
  final double? mainAxisExtend;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: UMSizes.gridViewSpacing,
        crossAxisSpacing: UMSizes.gridViewSpacing,
        mainAxisExtent: 250,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
