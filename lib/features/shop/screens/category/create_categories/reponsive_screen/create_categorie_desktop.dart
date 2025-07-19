import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/screens/category/create_categories/widgets/create_category_from.dart';
import 'package:admin_t_store/l10n/app_localizations.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/breadcrumb_item.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CreateCategorieDesktopScreen extends StatelessWidget {
  const CreateCategorieDesktopScreen({super.key});

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
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: local.categoryBreadcrumbCreate,
                breadcrumbItems: [
                  BreadcrumbItem(
                    local.categoriesStoragePath,
                    route: TRoutes.categories,
                  ),
                  BreadcrumbItem(local.categoryBreadcrumbCreate),
                ],
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
