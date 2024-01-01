import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unimatcher/app.dart';
import 'package:unimatcher/data/repositories/Authentication/authenticationrepository.dart';
import 'package:unimatcher/firebase_options.dart';

Future<void> main() async {
  ///Widgets Binding
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///Init GetX (Local Storage)
  await GetStorage.init();

  ///Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  ///Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}
