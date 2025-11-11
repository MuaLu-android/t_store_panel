import 'package:trip_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:trip_store/features/shop/models/brand_model.dart';
import 'package:trip_store/features/shop/screens/brands/edit_brands/widgets/edit_brands_form.dart';
import 'package:trip_store/l10n/app_localizations.dart';
import 'package:trip_store/route/route.dart';
import 'package:trip_store/utils/constants/breadcrumb_item.dart';
import 'package:trip_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditBrandsDesktop extends StatelessWidget {
  const EditBrandsDesktop({super.key, required this.brands});
  final BrandModel brands;
  @override
  Widget build(BuildContext context) {
    // implement build
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Bread crumb
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: local.brandEditHeading,
                breadcrumbItems: [
                  BreadcrumbItem(
                    local.brandsStoragePath,
                    route: TRoutes.brands,
                  ),
                  BreadcrumbItem(local.brandEditHeading),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // From
              EditBrandsForm(brands: brands),
            ],
          ),
        ),
      ),
    );
  }
}
