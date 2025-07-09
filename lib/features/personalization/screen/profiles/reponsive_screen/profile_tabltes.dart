import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/features/personalization/screen/profiles/widgets/image_and_meta.dart';
import 'package:admin_t_store/features/personalization/screen/profiles/widgets/profile_form.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileTabletsScreen extends StatelessWidget {
  const ProfileTabletsScreen({super.key});

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
              // Breandcrumbs
              TBreadcrumbWithHeading(
                heading: 'Profile',
                breadcrumbItems: ['Profile'],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              // Body
              Expanded(child: Chip(label: ImageAndMeta())),
              const SizedBox(height: TSizes.spaceBtwSections),
              // From
              Expanded(flex: 2, child: ProfileForm()),
            ],
          ),
        ),
      ),
    );
  }
}
