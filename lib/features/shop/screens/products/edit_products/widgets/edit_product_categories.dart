import 'package:admin_hmoob_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_hmoob_store/features/shop/controllers/categories/category_controller.dart';
import 'package:admin_hmoob_store/features/shop/controllers/products/edit_product_controller.dart';
import 'package:admin_hmoob_store/features/shop/models/category_model.dart';
import 'package:admin_hmoob_store/features/shop/models/product_model.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:admin_hmoob_store/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class EditProductCategories extends StatelessWidget {
  const EditProductCategories({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = EditProductController.instance;
    final categoryController = CategoryController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories label
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          // MultiSelectDialogField for selecting categories
          FutureBuilder(
            future: controller.loadSelectedCategories(product.id),
            builder: (context, snapshot) {
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
              );
              if (widget != null) return widget;
              return MultiSelectDialogField(
                buttonText: const Text('Select Categories'),
                title: const Text('Categories'),
                initialValue: List<CategoryModel>.from(
                  controller.selectedCategories,
                ),
                items: categoryController.allItems
                    .map((item) => MultiSelectItem(item, item.name))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (value) {
                  controller.selectedCategories.assignAll(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
