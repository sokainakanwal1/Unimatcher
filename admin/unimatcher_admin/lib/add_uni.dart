import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unimatcher_admin/utils/constants/colors.dart';
import 'package:unimatcher_admin/utils/constants/image_strings.dart';
import 'package:unimatcher_admin/resources/add_data.dart';

import 'dart:math';
import 'package:get/get.dart';
import 'dart:convert';

class AddUniversity extends StatefulWidget {
  const AddUniversity({Key? key}) : super(key: key);

  @override
  State<AddUniversity> createState() => _AddUniversityState();
}

class _AddUniversityState extends State<AddUniversity> {
  List<String> degrees = [
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
  ];

  Map<String, TextEditingController> feeControllers = {};

  @override
  void initState() {
    super.initState();
    // Initialize text controllers for fees
    degrees.forEach((degree) {
      feeControllers[degree] =
          TextEditingController(); // Create a new controller for each degree
    });
  }

  @override
  void dispose() {
    // Dispose text controllers
    feeControllers.values.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  String? imageUrl;
  String? provinceValue;
  String? sectorValue;
  String? hostelValue;
  String? sportsValue;
  String? coEducationValue;
  String? scholarshipValue;
  final List<String> sector = ['Public', 'Private'];
  final List<String> province = [
    'Punjab',
    'KPK',
    'Balochistan',
    'Sindh',
    'Gilgit Baltistan'
  ];
  final List<String> admissionCriteria = [
    '40%-50%',
    '60%-70%',
    '80%-85%',
  ];
  String? selectedAdmissionCriteria;
  final List<String> choose = ['Yes', 'No'];
  Uint8List? image;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController qsController = TextEditingController();
  TextEditingController hecController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    XFile? imageFile = await _imagePicker.pickImage(
      source: source,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (imageFile != null) {
      Uint8List imgBytes = await imageFile.readAsBytes();
      setState(() {
        image = imgBytes;
        imageUrl = null; // Clear imageUrl if a new image is picked
        // Update imageUrl with the new image file
        imageUrl = imageFile.path;
      });
    } else {
      print('No Image Selected');
    }
  }

  void resetFields() {
    setState(() {
      imageUrl = null;
      namecontroller.clear();
      qsController.clear();
      hecController.clear();
      cityController.clear();
      selectedAdmissionCriteria = null;
      provinceValue = null;
      sectorValue = null;
      hostelValue = null;
      sportsValue = null;
      coEducationValue = null;
      scholarshipValue = null;
      // Clear fee controller values
      feeControllers.forEach((_, controller) {
        controller.clear();
      });
    });
  }

  void saveUniversity() async {
    // Ensure degrees and feeControllers are not null
    if (degrees.isNotEmpty && feeControllers.isNotEmpty) {
      // Retrieve input field values
      Map<String, String> degreeValues = {};
      degrees.forEach((degree) {
        degreeValues[degree] = feeControllers[degree]!.text;
      });
      String name = namecontroller.text;
      String qsRanking = qsController.text;
      String hecRanking = hecController.text;
      String cityValue = cityController.text;

      // Upload image to Firebase Storage
      String imagePath =
          'images/universities/${DateTime.now().millisecondsSinceEpoch}.jpg';
      String imageUrl =
          await StoreData().uploadImageToFirebase(imagePath, image!);

      // Save university data to Firestore and get the universityId
      String universityId = await StoreData().saveData(
        name: name,
        imageUrl: imageUrl,
        hecRanking: hecRanking,
        qsRanking: qsRanking,
        provinceValue: provinceValue!,
        sectorValue: sectorValue!,
        hostelValue: hostelValue!,
        sportsValue: sportsValue!,
        coEducationValue: coEducationValue!,
        scholarshipValue: scholarshipValue!,
        admissionCriteriaValue: selectedAdmissionCriteria!,
        cityValue: cityValue,
        degreeValues: degreeValues,
      );

      // Show result
      print('University Saved with ID: $universityId');

      // Now you can use the universityId to save degree data
      String degreeSaveResult =
          await StoreData().saveDegreeData(universityId, degrees);
      print('Degree Save Result: $degreeSaveResult');
    } else {
      print('Error: Degrees or feeControllers is empty');
    }
    resetFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add University",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .apply(color: UMColors.primary, fontSizeDelta: 7),
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upload University Picture",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .apply(color: UMColors.primary, fontSizeDelta: 3),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Stack(
                      children: [
                        imageUrl != null
                            ? Image.network(
                                imageUrl!,
                                height: 128,
                                width: 128,
                                fit: BoxFit.cover,
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: AssetImage(UMImages.lahore),
                              ),
                        Positioned(
                          child: IconButton(
                            onPressed: () => pickImage(ImageSource.gallery),
                            icon: Icon(Icons.add_a_photo),
                          ),
                          bottom: -10,
                          left: 80,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "University Name",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .apply(color: UMColors.black, fontSizeDelta: 7),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter University Name",
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    "QS Ranking",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .apply(color: UMColors.black, fontSizeDelta: 7),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: qsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter QS Ranking",
                      ),
                    ),
                  ),
                  Text("HEC Ranking",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: hecController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter HEC Ranking",
                      ),
                    ),
                  ),
                  Text(
                    "Admission Criteria",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: UMColors.black, fontSizeDelta: 7),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: admissionCriteria.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedAdmissionCriteria = value;
                          });
                        },
                        value: selectedAdmissionCriteria,
                        hint: Text("Select Admission Criteria"),
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
                  Text("City",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: cityController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter City",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("Select Province",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: province
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            provinceValue = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Province"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: provinceValue,
                    )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Select Sector",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: sector
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            sectorValue = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Sector"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: sectorValue,
                    )),
                  ),
                  Text("Hostel Facility",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: choose
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            hostelValue = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Hostel Facility"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: hostelValue,
                    )),
                  ),
                  Text("Sports Quota",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: choose
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            sportsValue = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Sports Quota"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: sportsValue,
                    )),
                  ),
                  Text("Co-Education",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: choose
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            coEducationValue = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Co-Education"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: coEducationValue,
                    )),
                  ),
                  Text("Provide Scholarship",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color(0xFFececf8),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                      items: choose
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            scholarshipValue = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Provide Scholarship"),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: scholarshipValue,
                    )),
                  ),
                  SizedBox(height: 30.0),
                  Text("Add Fee Structure",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: UMColors.black, fontSizeDelta: 7)),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (String degree in degrees)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // Degree name with leading space
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '  $degree', // Add leading space
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              8.0, // Spacing between degree and field
                                        ),
                                        // Fixed-width input field
                                        SizedBox(
                                          width: 200.0,
                                          height: 28,
                                          // Adjust width as needed
                                          child: TextField(
                                            controller: feeControllers[degree],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText:
                                                  '', // Remove label text
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          10.0, // Additional space after each input field
                                    ),
                                  ],
                                ),
                              SizedBox(height: 20.0), // Spacing after last row
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  GestureDetector(
                    onTap: saveUniversity,
                    child: Center(
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
