import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:admin_t_store/features/shop/controllers/customer/customer_details_controller.dart';
import 'package:admin_t_store/features/shop/screens/customers/customer_details/tables/customer_tables_order.dart';
import 'package:admin_t_store/utils/constants/colors.dart';
import 'package:admin_t_store/utils/constants/image_strings.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomerOrders extends StatelessWidget {
  const CustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = CustomerDetailController.instance;
    controller.getCustomerOrders();
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(() {
        if (controller.ordersLoading.value) return const TLoaderAnimation();
        if (controller.allCustomerOrders.isEmpty) {
          return TAnimationLoaderWidget(
            text: 'No Orders Found',
            animation: TImages.pencilanimation,
          );
        }

        final totalAmount = controller.allCustomerOrders.fold(
          0.0,
          (previousValue, element) => previousValue + element.totalAmount,
        );
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Totel Spent '),
                      TextSpan(
                        text: '\$${totalAmount.toStringAsFixed(2)}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.apply(color: TColors.primary),
                      ),
                      TextSpan(
                        text:
                            ' on ${controller.allCustomerOrders.length} Order',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              controller: controller.searchTextController,
              onChanged: (query) => controller.searchQuery(query),
              decoration: const InputDecoration(
                hintText: 'Search Orders',
                prefixIcon: Icon(Iconsax.search_normal),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const CustomerOrderTablets(),
          ],
        );
      }),
    );
  }
}
