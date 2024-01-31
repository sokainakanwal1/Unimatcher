import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class Row4 extends StatelessWidget {
  const Row4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          UMSizes.defaultSpace * 0.4,
          UMSizes.defaultSpace * 0.1,
          UMSizes.defaultSpace * 0.4,
          UMSizes.defaultSpace * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort, size: 18),
                hintText: 'Sports Quota',
              ),
              onChanged: (value) {},
              items: ['Yes', 'No']
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(
            width: UMSizes.spaceBtwInputFields,
          ),
          Expanded(
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort, size: 18),
                hintText: 'Co-Education',
              ),
              onChanged: (value) {},
              items: ['Yes', 'No']
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(
                          option,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
