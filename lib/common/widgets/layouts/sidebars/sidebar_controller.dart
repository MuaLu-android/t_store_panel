import 'package:admin_t_store/utils/devices/device_utility.dart';
import '../../../../../route/route.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  final activeItem = TRoutes.reponsiveDesignTutoralScreen.obs;
  final hoverItem = ''.obs;
  void changeActiveItem(String route) => activeItem.value = route;
  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);
      if (TDeviceUtils.isMobileScreen(Get.context!)) Get.back();
      Get.toNamed(route);
    }
  }
}
