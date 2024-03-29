import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unimatcher_admin/utils/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditUniversityScreen extends StatefulWidget {
  final DocumentSnapshot uni;

  EditUniversityScreen({required this.uni});

  @override
  _EditUniversityScreenState createState() => _EditUniversityScreenState();
}

class _EditUniversityScreenState extends State<EditUniversityScreen> {
  final List<String> admissionCriteria = [
    '40%-50%',
    '60%-70%',
    '80%-85%',
  ];
  String? selectedAdmissionCriteria;
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
  final List<String> choose = ['Yes', 'No'];
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController qsController = TextEditingController();
  TextEditingController hecController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  Map<String, String?> degreeControllers = {};

  @override
  void initState() {
    super.initState();
    nameController.text = widget.uni['Name'];
    qsController.text = widget.uni['QSRanking'];
    hecController.text = widget.uni['HECRanking'];
    cityController.text = widget.uni['City'];
    provinceValue = widget.uni['provinceValue'];
    sectorValue = widget.uni['sectorValue'];
    hostelValue = widget.uni['hostelValue'];
    sportsValue = widget.uni['sportsValue'];
    coEducationValue = widget.uni['coEducationValue'];
    scholarshipValue = widget.uni['scholarshipValue'];
    selectedAdmissionCriteria = widget.uni['AdmissionCriteria'];
    // Initialize degree controllers
    widget.uni['Degrees'].forEach((degree) {
      degreeControllers[degree['degree']] =
          degree['fee'].toString(); // Convert fee to string
    });
  }

  Future<void> updateUniversity(Map<String, dynamic> updatedData) async {
    await widget.uni.reference.update(updatedData);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    final XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      final Uint8List img = await _file.readAsBytes();
      setState(() {
        image = img;
      });
    }
  }

  Future<void> saveUniversity() async {
    final String name = nameController.text;
    final String qsRanking = qsController.text;
    final String hecRanking = hecController.text;
    final String cityValue = cityController.text;

    if (name.isNotEmpty &&
        qsRanking.isNotEmpty &&
        hecRanking.isNotEmpty &&
        cityValue.isNotEmpty) {
      try {
        // Prepare degree data
        print('here it comes');
        List<Map<String, dynamic>> degrees = [];
        degreeControllers.forEach((key, value) {
          degrees.add({
            'degree': key,
            'fee': value.toString(), // Treat fee as string
          });
        });

        await updateUniversity({
          'Name': name,
          'QSRanking': qsRanking,
          'HECRanking': hecRanking,
          'City': cityValue,
          'provinceValue': provinceValue,
          'sectorValue': sectorValue,
          'hostelValue': hostelValue,
          'sportsValue': sportsValue,
          'coEducationValue': coEducationValue,
          'scholarshipValue': scholarshipValue,
          'AdmissionCriteria': selectedAdmissionCriteria!,
          'Degrees': degrees,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('University updated successfully')),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update university')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 600),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Edit University'),
          ),
          body: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University Picture',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Center(
                        child: Stack(
                          children: [
                            image != null
                                ? CircleAvatar(
                                    radius: 64,
                                    backgroundImage: MemoryImage(image!),
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    // Use NetworkImage if image is stored in Firebase Storage
                                    // backgroundImage: NetworkImage(selectedImageUrl),
                                    child: Icon(Icons.school),
                                  ),
                            Positioned(
                              bottom: -10,
                              left: 80,
                              child: IconButton(
                                icon: Icon(Icons.add_a_photo),
                                onPressed: () {
                                  pickImage(ImageSource.gallery);
                                },
                              ),
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
                          controller: nameController,
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
                      // Degrees Section
                      Text(
                        'Degrees',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Degree Fee Structure',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        children: degreeControllers.keys.map((degreeName) {
                          TextEditingController controller =
                              TextEditingController(
                            text: degreeControllers[degreeName] ?? '',
                          );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                degreeName,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              TextField(
                                controller: controller,
                                keyboardType: TextInputType.number,
                                onChanged: (value) =>
                                    degreeControllers[degreeName] = value,
                                decoration: InputDecoration(
                                  labelText: 'Fee',
                                  border: OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                            ],
                          );
                        }).toList(),
                      ),
                      // Save Button
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
                                  "Update",
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
        ),
      ),
    );
  }
}
