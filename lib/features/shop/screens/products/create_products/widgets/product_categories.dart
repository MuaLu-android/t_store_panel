import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/models/category_model.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

class ProductCategoriesScreen extends StatelessWidget {
  const ProductCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories label
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          // MultiSelectDialogField for selecting categories
          MultiSelectDialogField(
            buttonText: const Text('Select Categories'),
            title: const Text('Categories'),
            items: [
              MultiSelectItem(
                CategoryModel(id: 'id', name: 'Shoes', iamge: 'image'),
                'Shoes',
              ),
              MultiSelectItem(
                CategoryModel(id: 'id', name: 'Shirts', iamge: 'image'),
                'Shirts',
              ),
            ],
            listType: MultiSelectListType.CHIP,
            onConfirm: (value) {},
          ),
        ],
      ),
    );
  }
}
