import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class Row5 extends StatelessWidget {
  const Row5({
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
                prefixIcon: Icon(
                  Iconsax.sort,
                  size: 18,
                ),
                hintText: 'Proivde Scholarships',
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
            child: SizedBox(
              height: 55,
              width: UMSizes.buttonWidth,
              child: ElevatedButton(
                onPressed: () => const Text('Hello'),
                child: const Text('Apply Prefrence'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
