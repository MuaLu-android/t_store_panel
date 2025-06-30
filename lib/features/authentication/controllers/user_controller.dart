import 'package:admin_t_store/data/repositories/users/user_model.dart';
import 'package:admin_t_store/data/repositories/users/user_repository.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    // implement onInit
    fetchUserDetails();
    super.onInit();
  }

  /// Fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = true;
      TLoaders.errorSnackBar(
        title: 'Something went wrong',
        message: e.toString(),
      );
      return UserModel.empty();
    }
  }
}
