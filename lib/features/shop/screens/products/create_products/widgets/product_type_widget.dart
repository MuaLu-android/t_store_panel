import 'package:admin_t_store/utils/constants/enums.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductTypeWidget extends StatelessWidget {
  const ProductTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return Row(
      children: [
        Text('Product Type', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: TSizes.spaceBtwItems),
        // Radio button for Single Type
        RadioMenuButton(
          value: ProductType.single,
          groupValue: ProductType.single,
          onChanged: (value) {},
          child: const Text('Single'),
        ),
        // Radio button for variable Product type
        RadioMenuButton(
          value: ProductType.variable,
          groupValue: ProductType.variable,
          onChanged: (value) {},
          child: const Text('Variable'),
        ),
      ],
    );
  }
}
