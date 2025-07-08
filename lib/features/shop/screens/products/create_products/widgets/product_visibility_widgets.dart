import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductVisibilityWidgets extends StatelessWidget {
  const ProductVisibilityWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Visibility Header
          Text('Visibility', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Radio buttons for product visibility
          Column(
            children: [
              _buiidVisibilityRadioButton(
                ProductVisibility.published,
                'Published',
              ),
              _buiidVisibilityRadioButton(ProductVisibility.hidden, 'Hidden'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buiidVisibilityRadioButton(ProductVisibility value, String s) {
    return RadioMenuButton<ProductVisibility>(
      value: value,
      groupValue: ProductVisibility.published,
      onChanged: (selection) {},
      child: Text(s),
    );
  }
}
