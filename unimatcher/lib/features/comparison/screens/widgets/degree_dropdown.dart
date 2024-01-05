import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class DegreeDropDown extends StatelessWidget {
  const DegreeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        (UMSizes.defaultSpace * 1.5),
        (UMSizes.defaultSpace * 0.1),
        (UMSizes.defaultSpace * 1.5),
        (UMSizes.defaultSpace * 0.6),
      ),
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: const InputDecoration(
          prefixIcon: Icon(Iconsax.sort),
          hintText: 'Select a Program',
        ),
        onChanged: (value) {},
        items: [
          'BS Computer Science',
          'BBA',
          'BS Software Engineering',
          'BS Law',
          'MBBS',
          'Bachelor of Business Administration',
          'BS Fashion and Design',
          'MBA',
          'BS Medical',
          'BS Physics',
          'BS Accounting and Finance',
          'Bachelor of Fine Arts and Design',
          'BS Computer Science',
          'Chartered Accountancy',
          'BS Medical Sciences',
          'BS Pharmacy',
          'BS Sociology',
          'BS Agricultural Sciences',
          'BS Biotechnology',
          'BS Electrical Engg',
          'BS Mass Communication',
          'BSc Engineering',
          'BS Chemistry',
          'BS Dentistry',
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
    );
  }
}
