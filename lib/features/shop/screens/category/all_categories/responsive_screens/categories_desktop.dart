import 'package:trip_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:trip_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:trip_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:trip_store/features/shop/controllers/categories/category_controller.dart';
import 'package:trip_store/features/shop/screens/category/all_categories/tables/data_table.dart';
import 'package:trip_store/common/widgets/data_table/tables_header.dart';
import 'package:trip_store/l10n/app_localizations.dart';
import 'package:trip_store/route/route.dart';
import 'package:trip_store/utils/constants/breadcrumb_item.dart';
import 'package:trip_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesDesktopScreen extends StatelessWidget {
  const CategoriesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(CategoryController());
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBreadcrumbWithHeading(
                heading: local.categories,
                breadcrumbItems: [BreadcrumbItem(local.categories)],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // Table Body
              // Show Loader
              TRoundedContainer(
                child: Column(
                  children: [
                    // Table Header
                    TTableHeader(
                      buttonText: local.createNewCategory,
                      onPressed: () => Get.toNamed(TRoutes.createCategory),
                      seatrchController: controller.searchTextController,
                      searchOnChanged: (query) => controller.searchQuery(query),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Table
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const TLoaderAnimation();
                      }
                      return TCategoryTablets();
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
