import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:unimatcher_admin/add_uni.dart';

import 'package:unimatcher_admin/admin_login.dart';
import 'package:unimatcher_admin/utils/constants/colors.dart';
import 'package:unimatcher_admin/homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UniMatcher Admin Panel',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: UMColors.primary, body: MyHomePage()),
    );
  }
}
