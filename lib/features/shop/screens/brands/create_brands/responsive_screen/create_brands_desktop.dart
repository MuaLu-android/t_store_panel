import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/screens/brands/create_brands/widgets/create_brands_form.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CreateBrandsDesktop extends StatelessWidget {
  const CreateBrandsDesktop({super.key});
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
              // Breadrumbs
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Create Brands',
                breadcrumbItems: [TRoutes.brands, 'Creat Brands'],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              // Forms
              CreateBrandsForm(),
            ],
          ),
        ),
      ),
    );
  }
}
