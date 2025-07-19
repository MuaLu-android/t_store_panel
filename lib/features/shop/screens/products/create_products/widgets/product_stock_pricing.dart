import 'package:admin_hmoob_store/features/shop/controllers/products/create_product_controller.dart';
import 'package:admin_hmoob_store/utils/constants/enums.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:admin_hmoob_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductStockAndPricing extends StatelessWidget {
  const ProductStockAndPricing({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = CreateProductController.instance;
    return Obx(
      () => controller.productType.value == ProductType.single
          ? Form(
              key: controller.stockPriceFromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stock
                  FractionallySizedBox(
                    widthFactor: 0.45,
                    child: TextFormField(
                      controller: controller.stock,
                      decoration: const InputDecoration(
                        labelText: 'Stock',
                        hintText: 'Add Stock, only numbers are allowed',
                      ),
                      validator: (value) =>
                          TValidator.validateEmptyText('Stock', value),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  // Pricing
                  Row(
                    children: [
                      // Price
                      Expanded(
                        child: TextFormField(
                          controller: controller.price,
                          decoration: const InputDecoration(
                            labelText: 'Price',
                            hintText: 'Price with up-to 2 decimals',
                          ),
                          validator: (value) =>
                              TValidator.validateEmptyText('Price', value),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}$'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      // Sale Price
                      Expanded(
                        child: TextFormField(
                          controller: controller.salePrice,
                          decoration: const InputDecoration(
                            labelText: 'Discounted Price',
                            hintText: 'Price with up-to 2 decimals',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}$'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
