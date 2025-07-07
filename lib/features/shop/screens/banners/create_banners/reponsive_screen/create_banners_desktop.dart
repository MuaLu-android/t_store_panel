import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/shop/screens/banners/create_banners/widgets/create_banners_form.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CreateBannersDesktopScreen extends StatelessWidget {
  const CreateBannersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breand crumder
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Create Banner',
                breadcrumbItems: [TRoutes.banners, 'Create Banners'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Form
              CreateBannersForm(),
            ],
          ),
        ),
      ),
    );
  }
}
