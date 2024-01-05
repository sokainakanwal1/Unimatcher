import 'package:flutter/material.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class InputMarks extends StatelessWidget {
  const InputMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UMAppBar(
        title: Text('Input Marks'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: double.infinity,
                child:
                    const Image(image: AssetImage(UMImages.onBoardingImage2))),
            _buildInputField('Enter Matric Marks..'),
            const SizedBox(height: UMSizes.spaceBtwInputFields),
            _buildInputField('Enter Intermediate Marks..'),
            const SizedBox(height: UMSizes.spaceBtwInputFields),
            _buildInputField('Enter Entry Test Marks..'),
            const SizedBox(height: UMSizes.spaceBtwSections),
            SizedBox(
              height: 60,
              width: UMSizes.buttonWidth,
              child: ElevatedButton(
                onPressed: () => const Text('Hello'),
                child: Text(
                  'Calculate',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aggregate: 90.1%',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: UMColors.primary),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
