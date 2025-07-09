import 'package:admin_t_store/data/repositories/categories/category_reponsitory.dart';
import 'package:admin_t_store/features/shop/models/category_model.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  RxBool isLoaging = true.obs;
  RxList<CategoryModel> allItems = <CategoryModel>[].obs;
  RxList<CategoryModel> filteredItems = <CategoryModel>[].obs;

  final _categoryRepository = Get.put(CategoryReponsitory());
  @override
  void onInit() {
    // implement onInit
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoaging.value = true;
      List<CategoryModel> fetchedItems = [];
      if (allItems.isEmpty) {
        fetchedItems = await _categoryRepository.getAllCategories();
      }
      allItems.assignAll(fetchedItems);
      filteredItems.assignAll(allItems);
      isLoaging.value = false;
    } catch (e) {
      isLoaging.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
