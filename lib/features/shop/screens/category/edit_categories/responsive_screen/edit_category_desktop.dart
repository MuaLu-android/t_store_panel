import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/models/category_model.dart';
import 'package:admin_t_store/features/shop/screens/category/edit_categories/widgets/edit_category_from.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditCategoryDesktopScreen extends StatelessWidget {
  const EditCategoryDesktopScreen({super.key, required this.catedoryModel});
  final CatedoryModel catedoryModel;
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
              // Breadcrombs
              const TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Update Category',
                breadcrumbItems: [TRoutes.categories, 'Update Category'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              EditCategoryFromScreen(catedoryModel: catedoryModel),
            ],
          ),
        ),
      ),
    );
  }
}
