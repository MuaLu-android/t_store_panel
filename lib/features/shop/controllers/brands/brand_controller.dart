import 'package:admin_t_store/data/abstract/base_data_table_controller.dart';
import 'package:admin_t_store/data/repositories/brands/brand_repository.dart';
import 'package:admin_t_store/features/shop/controllers/categories/category_controller.dart';
import 'package:admin_t_store/features/shop/models/brand_model.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:html/dom.dart' hide Text;

class BrandController extends TBaseController<BrandModel> {
  static BrandController get instance => Get.find();

  final _brandRepository = Get.put(BrandRepository());
  final categoryController = Get.put(CategoryController());

  @override
  bool containsSearchQuery(item, String query) {
    return item.name.toLowerCase().contains(query.toLowerCase());
  }

  @override
  Future<void> deleteItem(item) async {
    Get.defaultDialog(
      title: 'Delete Item',
      content: const Text('Are you sure you wan to delete this item?'),
      actions: [
        SizedBox(
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
            onPressed: () async => await deleteOnConfirm(item),
            child: const Text('OK'),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwInputFields),
        SizedBox(
          width: 60,
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: TColors.darkerGrey.withAlpha(128),
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.buttonHeight / 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5),
              ),
            ),
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }

  @override
  Future<List<BrandModel>> fetchItems() async {
    final fetchenBrands = await _brandRepository.getAllBrands();
    // get all brandsCategories
    final fetchedBrandsCategories = await _brandRepository
        .getAllBrandCategories();
    // fetch all categories is data does not already exits
    if (categoryController.allItems.isNotEmpty) {
      await categoryController.fetchItems();
    }
    for (var brand in fetchenBrands) {
      //extract categoryIds from the documents
      List<String> categoryIds = fetchedBrandsCategories
          .where((brandCategory) => brandCategory.brandId == brand.id)
          .map((brandCategory) => brandCategory.categoryId)
          .toList();
      brand.brandCategories = categoryController.allItems
          .where((category) => categoryIds.contains(category.id))
          .toList();
    }
    return fetchenBrands;
  }

  // sort bay name
  void sortByName(int sortColumnIndex, bool ascending) {
    sort(
      sortColumnIndex,
      ascending,
      ((BrandModel item) => item.name.toLowerCase()),
    );
  }
}
