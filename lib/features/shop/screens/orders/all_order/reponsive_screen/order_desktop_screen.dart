import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/data_table/tables_header.dart';
import 'package:admin_t_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:admin_t_store/features/shop/controllers/order/oder_controller.dart';
import 'package:admin_t_store/features/shop/screens/orders/all_order/tables/order_table_screen.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDesktopScreen extends StatelessWidget {
  const OrderDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = OrderController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breand crumbs
            TBreadcrumbWithHeading(
              heading: 'Orders',
              breadcrumbItems: ['Orders'],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // Table Body
            TRoundedContainer(
              child: Column(
                children: [
                  // Table Header
                  TTableHeader(
                    showLeftWidget: false,
                    seatrchController: controller.searchTextController,
                    searchOnChanged: (query) => controller.searchQuery(query),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  //Table
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TLoaderAnimation();
                    }
                    return const OrderTableScreen();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
