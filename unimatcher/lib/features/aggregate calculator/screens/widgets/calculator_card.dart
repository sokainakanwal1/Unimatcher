import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class CalculatorCard extends StatelessWidget {
  const CalculatorCard(
      {super.key,
      required this.title,
      required this.imagePath,
      this.icon = Iconsax.arrow_right_34,
      required this.onPressed});
  final String imagePath;
  final IconData icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          color: UMColors.primary.withOpacity(0.9),
          margin: const EdgeInsets.all(19.0),
          elevation: 5,
          shadowColor: UMColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const SizedBox(
                  width: UMSizes.defaultSpace,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29.0),
                    border: Border.all(
                      color: Colors.white, // Set your desired border color
                      width: 2.0, // Set the width of the border
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      imagePath,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: UMSizes.defaultSpace,
                ),
                Expanded(
                    flex: 5,
                    child: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: Colors.white))),
                Expanded(
                  child: Icon(
                    icon,
                    size: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
