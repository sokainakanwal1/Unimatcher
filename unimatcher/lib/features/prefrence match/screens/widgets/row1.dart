import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class Row1 extends StatelessWidget {
  const Row1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          UMSizes.defaultSpace * 0.4,
          UMSizes.defaultSpace,
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
                hintText: 'Sector',
              ),
              onChanged: (value) {},
              items: [
                'Public',
                'Private',
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
                hintText: 'City',
              ),
              onChanged: (value) {},
              items: [
                'Karachi',
                'Lahore',
                'Peshawar',
                'Multan',
                'Quetta',
                'Islamabad',
                'Faisalabad',
                'Hyderabad',
                'Gujranwala',
                'Rawalpindi',
                'Sialkot',
                'Sargodha',
                'Bahawalpur',
                'Rahim Yar Khan',
                'Sheikhupura',
                'Gujrat',
                'Okara',
                'Sukkur',
                'Larkana',
                'Mardan',
                'Kasur',
                'Sahiwal',
                'Attock',
                'Tando Ādam',
                'Muridke',
                'Kot Addu',
                'Kamalia',
                'Mingora',
                'Jacobabad',
                'Abbottabad',
                'Jhelum',
                'Mīrpur Khās',
                'Hafizabad',
                'Kohat',
                'Nawabshah',
                'Chiniot',
                'Dera Ghazi Khan',
                'Mandi Bahauddin',
                'Burewala',
                'Mianwali',
                'Swabi',
                'Narowal',
                'Muzaffargarh',
                'Shahdādkot',
                'Tando Muhammad Khan',
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
        ],
      ),
    );
  }
}
