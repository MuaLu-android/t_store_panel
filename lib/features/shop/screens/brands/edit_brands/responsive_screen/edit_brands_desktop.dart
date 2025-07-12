import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/models/brand_model.dart';
import 'package:admin_t_store/features/shop/screens/brands/edit_brands/widgets/edit_brands_form.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditBrandsDesktop extends StatelessWidget {
  const EditBrandsDesktop({super.key, required this.brands});
  final BrandModel brands;
  @override
  Widget build(BuildContext context) {
    // implement build
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
                heading: 'Update Brands',
                breadcrumbItems: [TRoutes.brands, 'Update brands'],
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
