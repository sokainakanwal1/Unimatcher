import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:unimatcher_admin/add_uni.dart';
import 'package:unimatcher_admin/edit_univeristy_screen.dart';
import 'package:unimatcher_admin/rounded_image.dart';

class Universities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 800),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Universities',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => AddUniversity());
                  },
                  child: Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 11, 113, 111),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Universities')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot uni = snapshot.data.docs[index];
                      final imageUrl = uni['imageLink'] ?? '';
                      print(
                          imageUrl); // Assuming 'imageLink' is the field storing the image URL
                      return Card(
                        child: ListTile(
                          leading: RoundedImage(
                            imageUrl: imageUrl,
                            width: 80,
                            height: 80,
                            isNetworkImage: true,
                          ),

                          //  Image(
                          //     image: NetworkImage(imageUrl),
                          //   ),

                          title: Text(uni['Name']),
                          subtitle: Text(uni['City']),
                          onTap: () {
                            // Navigate to EditUniversityScreen and pass the university document data
                            Get.to(EditUniversityScreen(uni: uni));
                          },
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Perform delete operation
                              FirebaseFirestore.instance
                                  .collection('Universities')
                                  .doc(uni.id)
                                  .delete();
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
