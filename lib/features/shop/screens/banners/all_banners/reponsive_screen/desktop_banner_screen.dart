import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/common/widgets/data_table/tables_header.dart';
import 'package:admin_t_store/features/shop/screens/banners/all_banners/tablets/data_tablet.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DesktopBannerScreen extends StatelessWidget {
  const DesktopBannerScreen({super.key});

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
              // Breadcrumbs
              const TBreadcrumbWithHeading(
                heading: 'Banners',
                breadcrumbItems: ['Banners'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Ttablet header
              TTableHeader(
                buttonText: 'Create Banners',
                onPressed: () => Get.toNamed(TRoutes.createBanner),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Table
              BannerTablets(),
            ],
          ),
        ),
      ),
    );
  }
}
