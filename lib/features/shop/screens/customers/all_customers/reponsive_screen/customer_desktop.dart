import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/data_table/tables_header.dart';
import 'package:admin_t_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:admin_t_store/features/shop/controllers/customer/customer_controller.dart';
import 'package:admin_t_store/features/shop/screens/customers/all_customers/table/customer_tablet.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDesktopScreen extends StatelessWidget {
  const CustomerDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(CustomerController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breandcrumbs
              TBreadcrumbWithHeading(
                heading: 'Customers',
                breadcrumbItems: ['Customers'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                child: Column(
                  children: [
                    // Table Header
                    TTableHeader(
                      showLeftWidget: false,
                      seatrchController: controller.searchTextController,
                      searchOnChanged: (query) => controller.searchQuery(query),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Table
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const TLoaderAnimation();
                      }
                      return const CustomerTablet();
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
