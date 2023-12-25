import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/common/widgets/layout/university_grid_layout.dart';
import 'package:unimatcher/common/widgets/univeristies/univeristycard.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class CitiesUniversities extends StatelessWidget {
  const CitiesUniversities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UMAppBar(
        title: Text('Lahore'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: UMGridLayout(
              itemCount: 10, itemBuilder: (_, index) => const UniversityCard()),
        ),
      ),
    );
  }
}
