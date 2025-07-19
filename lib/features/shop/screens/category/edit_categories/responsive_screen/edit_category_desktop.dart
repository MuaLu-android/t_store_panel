import 'package:admin_hmoob_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_hmoob_store/features/shop/models/category_model.dart';
import 'package:admin_hmoob_store/features/shop/screens/category/edit_categories/widgets/edit_category_from.dart';
import 'package:admin_hmoob_store/l10n/app_localizations.dart';
import 'package:admin_hmoob_store/route/route.dart';
import 'package:admin_hmoob_store/utils/constants/breadcrumb_item.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditCategoryDesktopScreen extends StatelessWidget {
  const EditCategoryDesktopScreen({super.key, required this.catedoryModel});
  final CategoryModel catedoryModel;
  @override
  Widget build(BuildContext context) {
    // implement build
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrombs
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: local.categoryBreadcrumbEdit,
                breadcrumbItems: [
                  BreadcrumbItem(
                    local.categoriesStoragePath,
                    route: TRoutes.categories,
                  ),
                  BreadcrumbItem(local.categoryBreadcrumbEdit),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              EditCategoryFromScreen(category: catedoryModel),
            ],
          ),
        ),
      ),
    );
  }
}
