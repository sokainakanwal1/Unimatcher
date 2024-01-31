import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class Row3 extends StatelessWidget {
  const Row3({
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
                hintText: 'Fee Budget',
              ),
              onChanged: (value) {},
              items: [
                '5,00,000-10,00,000',
                '12,00,000-15,00,000',
                'up to 15,00,000'
              ]
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
                hintText: 'Hostel Facility',
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
