import 'package:admin_t_store/app.dart';
import 'package:admin_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:admin_t_store/firebase_options.dart';
import 'package:dynamic_path_url_strategy/dynamic_path_url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Entry point of Flutter App
Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetX Local Storage
  await GetStorage.init();
  // Remove # sign from url
  setPathUrlStrategy();
  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  //Main App Start here...
  runApp(const App());
}
