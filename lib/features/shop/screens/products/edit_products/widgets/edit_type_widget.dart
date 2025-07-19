import 'package:admin_hmoob_store/features/shop/controllers/products/edit_product_controller.dart';
import 'package:admin_hmoob_store/utils/constants/enums.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class EditProductTypeWidget extends StatelessWidget {
  const EditProductTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = EditProductController.instance;
    return Obx(
      () => Row(
        children: [
          Text('Product Type', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: TSizes.spaceBtwItems),
          // Radio button for Single Type
          RadioMenuButton(
            value: ProductType.single,
            groupValue: controller.productType.value,
            onChanged: (value) =>
                controller.productType.value = value ?? ProductType.single,
            child: const Text('Single'),
          ),
          // Radio button for variable Product type
          RadioMenuButton(
            value: ProductType.variable,
            groupValue: controller.productType.value,
            onChanged: (value) =>
                controller.productType.value = value ?? ProductType.single,
            child: const Text('Variable'),
          ),
        ],
      ),
    );
  }
}
