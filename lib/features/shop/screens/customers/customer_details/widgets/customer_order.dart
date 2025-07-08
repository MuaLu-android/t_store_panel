import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/screens/customers/customer_details/tables/customer_tables_order.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Order', style: Theme.of(context).textTheme.headlineMedium),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Totel Spent'),
                TextSpan(
                  text: '\$500.35',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.apply(color: TColors.primary),
                ),
                TextSpan(
                  text: ' on ${5} Order',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          TextFormField(
            onChanged: (query) {},
            decoration: const InputDecoration(
              hintText: 'Search Orders',
              prefixIcon: Icon(Iconsax.search_normal),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const CustomerOrderTablets(),
        ],
      ),
    );
  }
}
