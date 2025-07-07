import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/data_table/tables_header.dart';
import 'package:admin_t_store/features/shop/screens/products/all_products/tablets/tablet_products.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProductDesktopSreen extends StatelessWidget {
  const ProductDesktopSreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbWithHeading(
                heading: 'Products',
                breadcrumbItems: ['Products'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Table Body
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                      buttonText: 'App Product',
                      onPressed: () => Get.toNamed(TRoutes.createProduct),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Table
                    const TabletProductsScreen(),
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
