import 'package:admin_hmoob_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_hmoob_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_hmoob_store/common/widgets/data_table/tables_header.dart';
import 'package:admin_hmoob_store/common/widgets/layouts/templates/loader_animation.dart';
import 'package:admin_hmoob_store/features/shop/controllers/banner/banner_controller.dart';
import 'package:admin_hmoob_store/features/shop/screens/banners/all_banners/tablets/data_tablet.dart';
import 'package:admin_hmoob_store/l10n/app_localizations.dart';
import 'package:admin_hmoob_store/route/route.dart';
import 'package:admin_hmoob_store/utils/constants/breadcrumb_item.dart';
import 'package:admin_hmoob_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopBannerScreen extends StatelessWidget {
  const DesktopBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    final controller = Get.put(BannerController());
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbWithHeading(
                heading: local.banners,
                breadcrumbItems: [BreadcrumbItem(local.banners)],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Ttablet header
              TRoundedContainer(
                child: Column(
                  children: [
                    TTableHeader(
                      buttonText: local.createBanners,
                      onPressed: () => Get.toNamed(TRoutes.createBanner),
                      seatrchController: controller.searchTextController,
                      searchOnChanged: (query) => controller.searchQuery(query),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Table
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const TLoaderAnimation();
                      }
                      return BannerTablets();
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
