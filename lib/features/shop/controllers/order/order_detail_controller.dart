import 'package:admin_hmoob_store/features/shop/models/user_model.dart';
import 'package:admin_hmoob_store/data/repositories/users/user_repository.dart';
import 'package:admin_hmoob_store/features/shop/models/order_model.dart';
import 'package:admin_hmoob_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  static OrderDetailController get instance => Get.find();
  RxBool loading = true.obs;
  Rx<OrderModel> order = OrderModel.empty().obs;
  Rx<UserModel> users = UserModel.empty().obs;

  // Loader customer order
  Future<void> getCustomerOfCurrentOrder() async {
    try {
      loading.value = true;
      final user = await UserRepository.instance.fetchUsersDetails(
        order.value.userId,
      );
      users.value = user;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      loading.value = false;
    }
  }
}
