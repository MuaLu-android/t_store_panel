import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/features/shop/screens/category/all_categories/tables/data_table.dart';
import 'package:admin_t_store/common/widgets/data_table/tables_header.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/create_category_from.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCategorieDesktopScreen extends StatelessWidget {
  const CreateCategorieDesktopScreen({super.key});

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
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Create Category',
                breadcrumbItems: [TRoutes.categories, 'Create Category'],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // From
              CreateCategoryFrom(),
            ],
          ),
        ),
      ),
    );
  }
}
