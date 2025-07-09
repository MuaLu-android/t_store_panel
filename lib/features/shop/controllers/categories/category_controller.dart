import 'package:admin_t_store/data/repositories/categories/category_reponsitory.dart';
import 'package:admin_t_store/features/shop/models/category_model.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/popups/full_screen_loader.dart';
import 'package:admin_t_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  RxBool isLoaging = true.obs;
  RxList<CategoryModel> allItems = <CategoryModel>[].obs;
  RxList<CategoryModel> filteredItems = <CategoryModel>[].obs;
  RxList<bool> selectedRow = <bool>[].obs;

  // Dorting
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  // searchText
  final searchTextController = TextEditingController();

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
      selectedRow.assignAll(List.generate(allItems.length, (_) => false));
      isLoaging.value = false;
    } catch (e) {
      isLoaging.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Sort By name
  void sortByName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;
    filteredItems.sort((a, b) {
      if (ascending) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    });
  }

  // Sort by parentName
  void sortByParentName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;
    filteredItems.sort((a, b) {
      if (ascending) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      } else {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      }
    });
  }

  // Search
  void searchQuery(String query) {
    filteredItems.assignAll(
      allItems.where(
        (item) => item.name.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  // Delete Categories
  void confirmAndDeleteItem(CategoryModel category) {
    // show a confirmation dialog
    Get.defaultDialog(
      title: 'Delete Item',
      content: const Text('are you sure you wan to delete this item?'),
      confirm: SizedBox(
        width: 60,
        child: ElevatedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.buttonHeight / 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5),
            ),
          ),
          onPressed: () async => await deleteOnConfirm(category),
          child: const Text('OK'),
        ),
      ),
      cancel: SizedBox(),
    );
  }

  deleteOnConfirm(CategoryModel category) async {
    try {
      // Loader
      TFullScreenLoader.stopLoading();
      // Start the loader
      TFullScreenLoader.popUpCirular();
      // Delete FrieStore
      await _categoryRepository.deleteCategory(category.id);
      removeItemFromLists(category);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Item Daleted',
        message: 'Ypur Item has been Deletes',
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  /// Method for removing an item from the lists
  void removeItemFromLists(CategoryModel item) {
    allItems.remove(item);
    filteredItems.remove(item);
    selectedRow.assignAll(List.generate(allItems.length, (index) => false));

    update();
  }

  void addItemToList(CategoryModel item) {
    allItems.add(item);
    filteredItems.add(item);
    selectedRow.assignAll(List.generate(allItems.length, (index) => false));

    filteredItems.refresh();
  }
}
