import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/screens/banners/data/banner_model.dart';
import 'package:admin_t_store/features/shop/screens/banners/edit_banners/widgets/edit_banners_form.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EditBannersDesktopScreen extends StatelessWidget {
  const EditBannersDesktopScreen({super.key});

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
              // Header crumbe
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Update Banners',
                breadcrumbItems: [TRoutes.banners, 'Update Banners'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              EditBannersForm(
                bannerModel: BannerModel(
                  imageUrl: '',
                  targetScreen: '',
                  active: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
