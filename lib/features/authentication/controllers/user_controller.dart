import 'package:admin_t_store/data/repositories/users/user_model.dart';
import 'package:admin_t_store/data/repositories/users/user_repository.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      final user = await userRepository.fetchAdminDetails();
      return user;
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Something went wrong',
        message: e.toString(),
      );
      return UserModel.empty();
    }
  }
}
