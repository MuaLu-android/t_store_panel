import 'package:admin_t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:admin_t_store/data/repositories/users/user_model.dart';
import 'package:admin_t_store/data/repositories/users/user_repository.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/text_string.dart';
import 'package:admin_t_store/utils/helpers/network_manager.dart';
import 'package:admin_t_store/utils/popups/full_screen_loader.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  /// handles email and password sign-in process
  Future<void> emailAndPasswordSignIn() async {}

  /// Handles registraion of admin user
  Future<void> registerAdmin() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Registering Admin account...',
        TImages.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Register with Email and password
      await AuthenticationRepository.instance.registerWithEmailAndPassword(
        TTexts.adminEmail,
        TTexts.adminPasword,
      );
      // Create admin record in the Firebase
      final userRepository = Get.put(UserRepository());
      await userRepository.ceateUser(
        UserModel(
          id: AuthenticationRepository.instance.authUser!.uid,
          firstName: 'CWT',
          lastName: 'Admin',
          email: TTexts.adminEmail,
          role: AppRole.admin,
          createdAt: DateTime.now(),
        ),
      );
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screenRedirext();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
