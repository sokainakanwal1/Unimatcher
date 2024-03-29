import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher_admin/add_uni.dart';
import 'package:unimatcher_admin/dashboard.dart';
import 'package:unimatcher_admin/universities.dart';

class StudyMaterials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints:
            BoxConstraints(maxWidth: 800), // Adjust this value as needed
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Study Materials',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Study Material Name'),
                      subtitle: Text('Study Material Description'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Handle delete button tap
                        },
                      ),
                    ),
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
