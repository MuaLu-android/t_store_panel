import 'package:trip_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:trip_store/features/shop/models/banner_model.dart';
import 'package:trip_store/features/shop/screens/banners/edit_banners/widgets/edit_banners_form.dart';
import 'package:trip_store/l10n/app_localizations.dart';
import 'package:trip_store/route/route.dart';
import 'package:trip_store/utils/constants/breadcrumb_item.dart';
import 'package:trip_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditBannersDesktopScreen extends StatelessWidget {
  const EditBannersDesktopScreen({super.key, required this.banner});
  final BannerModel banner;
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
              // Header crumbe
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: local.bannerEditHeading,
                breadcrumbItems: [
                  BreadcrumbItem(
                    local.bannersStoragePath,
                    route: TRoutes.banners,
                  ),
                  BreadcrumbItem(local.bannerEditHeading),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              EditBannersForm(banner: banner),
            ],
          ),
        ),
      ),
    );
  }
}
