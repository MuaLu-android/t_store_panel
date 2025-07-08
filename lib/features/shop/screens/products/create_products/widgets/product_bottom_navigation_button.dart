import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductBottomNavigationButton extends StatelessWidget {
  const ProductBottomNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Discard button
          OutlinedButton(onPressed: () {}, child: const Text('Discard')),
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }
}
