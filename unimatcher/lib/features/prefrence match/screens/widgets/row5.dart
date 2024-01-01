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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.sort),
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
            width: TSizes.spaceBtwInputFields,
          ),
          Expanded(
            child: Container(
              height: 50,
              width: TSizes.buttonWidth,
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
