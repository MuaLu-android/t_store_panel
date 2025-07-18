// ignore: unused_import
import 'package:admin_t_store/features/authentication/controllers/user_controller.dart';
import 'package:admin_t_store/features/shop/controllers/settings/setting_controller.dart';
import 'package:admin_t_store/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  // ignore: void_checks
  void dependencies() {
    /// Core
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => SettingsController(), fenix: true);
  }
}
