import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb.dart';
import 'package:admin_t_store/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.marginWeb),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Breadcrumbs
                  TBreadcrumbWithHeading(
                    heading: 'Media',
                    breadcrumbItems: [
                      TRoutes.media,
                      TRoutes.reponsiveDesignTutoralScreen,
                    ],
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Uploads Area
              // Media
            ],
          ),
        ),
      ),
    );
  }
}
