import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher/common/widgets/appBar/appbar.dart';
import 'package:unimatcher/features/aggregate%20calculator/controllers/mdcat_controller.dart';
import 'package:unimatcher/features/aggregate%20calculator/controllers/nts_controller.dart';
import 'package:unimatcher/features/aggregate%20calculator/controllers/nums_controller.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/image_strings.dart';
import 'package:unimatcher/utils/constants/sizes.dart';

class NumsInput extends StatelessWidget {
  final NumsController _controller = Get.put(NumsController());

  NumsInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UMAppBar(
        title: Text('Input Marks'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: double.infinity,
                  child: const Image(
                      image: AssetImage(UMImages.onBoardingImage2))),
              _buildInputField(
                  'Enter Matric Marks..', _controller.setMatricMarks),
              const SizedBox(height: UMSizes.spaceBtwInputFields),
              _buildInputField('Enter Intermediate Marks..',
                  _controller.setIntermediateMarks),
              const SizedBox(height: UMSizes.spaceBtwInputFields),
              _buildInputField(
                  'Enter Entry Test Marks..', _controller.setEntryTestMarks),
              const SizedBox(height: UMSizes.spaceBtwSections),
              SizedBox(
                height: 60,
                width: UMSizes.buttonWidth,
                child: ElevatedButton(
                  onPressed: () => _controller.calculateAggregate(),
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
              Obx(
                () => Text(
                  'Aggregate: ${_controller.aggregate.value.toStringAsFixed(2)}%',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, Function(int) setMarks) {
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
        onChanged: (newValue) {
          final marks = int.tryParse(newValue) ?? 0;
          setMarks(marks);
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),
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
