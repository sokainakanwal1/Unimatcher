import 'package:flutter/material.dart';

class UMSectionHeading extends StatelessWidget {
  const UMSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.onPressed,
  });

  final Color? textColor;

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
