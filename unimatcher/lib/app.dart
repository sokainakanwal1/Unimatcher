import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:unimatcher/bindings/general_binding.dart';
import 'package:unimatcher/features/Home/screens/home.dart';
import 'package:unimatcher/features/authentication/screens/onboarding/onboadring.dart';
import 'package:unimatcher/navigation_menu.dart';
import 'package:unimatcher/utils/constants/colors.dart';
import 'package:unimatcher/utils/constants/text_strings.dart';
import 'package:unimatcher/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: UMTexts.appName,
      themeMode: ThemeMode.system,
      theme: UMAppTheme.lightTheme,
      darkTheme: UMAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      initialBinding: GeneralBindings(),
      //Circular loader meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(
          backgroundColor: UMColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )),
    );
  }
}
